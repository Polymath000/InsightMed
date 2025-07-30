import 'package:flutter/material.dart';

import '../../../../../core/helpers/decoration_widget.dart';
import '../../../../../core/utls/themes/app_colors.dart';
import 'upload_widget.dart';

class UploadRayImage extends StatefulWidget {
  const UploadRayImage({super.key, this.onChangedImagePath});
  final void Function(String?)? onChangedImagePath;

  @override
  State<UploadRayImage> createState() => _UploadRayImageState();
}

class _UploadRayImageState extends State<UploadRayImage> {
  @override
  Widget build(final BuildContext context) => decorationWidget(
    children: [
      const Text(
        'Upload Ray Image',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
      const SizedBox(height: 8),
      const Text(
        'JPG,or PNG formats accepted',
        style: TextStyle(color: AppColors.grey),
      ),
      const SizedBox(height: 24),
      UploadWidget(
        onChangImagePath: (final p0) {
          setState(() {
            widget.onChangedImagePath!(p0);
          });
        },
      ),
    ],
  );
}
