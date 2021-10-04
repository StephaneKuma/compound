import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MediaService {
  ImagePicker picker = ImagePicker();

  Future getImage({required bool fromGallery}) async {
    var xFile = await picker.pickImage(
      source: fromGallery ? ImageSource.gallery : ImageSource.camera,
    );

    // File? selectedFile;
    if (xFile != null) {
      return xFile.path;
    } else {
      return null;
    }
  }

  Future getLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      return response.file!.path;
    } else {
      return response.exception!.message;
    }
  }
}
