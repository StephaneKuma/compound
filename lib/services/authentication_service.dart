import 'package:compound/app/locator.dart';
import 'package:compound/models/user.dart' as m;
import 'package:compound/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  User? get currentUser => _firebaseAuth.currentUser;

  m.User? _userFromFirebaseUser(User? user) => user != null
      ? m.User(email: currentUser!.email, id: currentUser!.uid)
      : null;

  // auth change user stream
  Stream<m.User?> get user =>
      _firebaseAuth.authStateChanges().map(_userFromFirebaseUser);

  bool isUserLoggedIn() => currentUser != null;

  Future<bool> anonymousLogin() async {
    UserCredential userCredential = await _firebaseAuth.signInAnonymously();

    return userCredential.user != null;
  }

  Future signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user dound for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }

      return message;
    } catch (e) {
      return e.toString();
    }
  }

  Future signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String fullName,
    required String role,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      var user = m.User(
        id: userCredential.user!.uid,
        fullName: fullName,
        email: email,
        userRole: role,
      );
      _firestoreService.createUser(user);

      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'weak-password') {
        message = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      return message;
    } catch (e) {
      return e.toString();
    }
  }

  Future verifyUserEmail() async {
    if (currentUser != null && !currentUser!.emailVerified) {
      ActionCodeSettings actionCodeSettings = ActionCodeSettings(
        url: "",
        dynamicLinkDomain: 'example.page.link',
        androidPackageName: 'com.example.android',
        androidInstallApp: true,
        androidMinimumVersion: '12',
        iOSBundleId: 'com.example.ios',
        handleCodeInApp: true,
      );

      await currentUser!.sendEmailVerification(actionCodeSettings);
    }
  }

  void signOut() {
    _firebaseAuth.signOut();
  }

  Future reauthenticate({required String? password}) async {
    if (password == null) {
      return '';
    } else {
      AuthCredential credential = EmailAuthProvider.credential(
          email: currentUser!.email!, password: password);
      UserCredential userCredential =
          await currentUser!.reauthenticateWithCredential(credential);

      return userCredential.user != null;
    }
  }

  Future deleteUser() async {
    try {
      currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return 'The user must reaauthenticate before this operation can be executed';
      }
    }
  }
}
