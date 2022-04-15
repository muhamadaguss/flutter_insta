import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _picker = ImagePicker();

  XFile? _file = await _picker.pickImage(source: source);

  if (_file != null) {
    return await _file.readAsBytes();
  }

  print('No image selected');
}

showSnackbar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      duration: const Duration(seconds: 2),
    ),
  );
}
