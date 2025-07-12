import 'package:flutter/material.dart';
import '../../../../../core/utls/i_text.dart';

class UploadMedicalRayButton extends StatelessWidget {
  const UploadMedicalRayButton({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => FilledButton(
      onPressed: () {},
      child: const IText('Upload Medical Ray'),
    );
}
