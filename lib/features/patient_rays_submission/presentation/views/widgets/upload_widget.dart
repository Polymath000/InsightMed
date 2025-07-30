import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utls/themes/app_colors.dart';

class UploadWidget extends StatefulWidget {
  const UploadWidget({super.key, this.onChangImagePath});
  final void Function(String?)? onChangImagePath;

  @override
  State<UploadWidget> createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  @override
  Widget build(final BuildContext context) => GestureDetector(
    onTap: () async {
      final image = await FilePicker.platform.pickFiles();
      if (image != null) {
        final file = image.files.first;
        final imagePath = file.path;
        setState(() {
          widget.onChangImagePath!(imagePath);
        });
      }
    },
    child: const Card.filled(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.folder, size: 48, color: AppColors.grey),
              Text(
                'Drag & Drop or Browse Files',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Browse Files',
                style: TextStyle(color: AppColors.blue, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
