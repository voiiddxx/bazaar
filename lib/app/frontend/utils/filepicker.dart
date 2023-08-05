import 'dart:io';

import 'package:file_picker/file_picker.dart';

Future<List<File>> pickFiles() async {
  List<File> images = [];
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
  );

  if (result != null && result.files.isNotEmpty) {
    for (int i = 0; i < result!.files.length; i++) {
      images.add(File(result.files[i].path!));
    }
  }
  return images;
}
