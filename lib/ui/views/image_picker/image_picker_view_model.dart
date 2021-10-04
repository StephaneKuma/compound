import 'dart:io';

import 'package:compound/app/locator.dart';
import 'package:compound/services/media_service.dart';
import 'package:stacked/stacked.dart';

class ImagePickerViewModel extends BaseViewModel {
  final _mediaService = locator<MediaService>();
  File? _selectedFile;

  bool get hasSelectedImage => _selectedFile != null;

  File get selectedImage => _selectedFile!;

  Future selectImage({required bool fromGallery}) async {
    dynamic path = await runBusyFuture(
      _mediaService.getImage(fromGallery: fromGallery),
    );

    if (path is String) {
      _selectedFile = File(path);
    }

    _selectedFile = null;
  }
}
