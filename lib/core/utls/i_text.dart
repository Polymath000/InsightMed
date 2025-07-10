import 'package:flutter/widgets.dart'
    show
        InlineSpan,
        StatelessWidget,
        Text,
        TextAlign,
        TextDirection,
        TextOverflow,
        TextStyle,
        immutable;

import 'themes/app_colors.dart' show AppColors;
import 'themes/app_text_style.dart' show AppTextStyles;

@immutable
final class IText extends StatelessWidget {
  const IText(
    this.data, {
    this.style,
    this.textAlign,
    this.textDirection,
    this.softWrap = false,
    super.key,
  });
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final bool softWrap;
  @override
  Text build(_) => Text(
    data,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    softWrap: softWrap,
    overflow: TextOverflow.fade,
  );
}

@immutable
final class IRichText extends StatelessWidget {
  const IRichText(
    this.textSpan, {
    this.style,
    this.textAlign,
    this.softWrap = false,
    super.key,
  });
  final InlineSpan textSpan;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool? softWrap;

  @override
  Text build(_) => Text.rich(
    textSpan,
    style: style,
    textAlign: textAlign,
    softWrap: softWrap,
    overflow: TextOverflow.fade,
  );
}

@immutable
final class ErrorText extends StatelessWidget {
  const ErrorText(this.data, {super.key});
  final String data;
  @override
  IText build(_) => IText(
    data,
    style: AppTextStyles.bodySmall?.copyWith(color: AppColors.error),
  );
}
