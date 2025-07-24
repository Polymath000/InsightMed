import 'package:flutter/material.dart'
    show
        BoxConstraints,
        FocusManager,
        FormFieldValidator,
        InputDecoration,
        StatelessWidget,
        TextAlign,
        TextDirection,
        TextEditingController,
        TextFormField,
        TextInputAction,
        TextInputType,
        TextOverflow,
        TextStyle,
        ValueChanged,
        VoidCallback,
        Widget,
        immutable;
import 'package:flutter/services.dart' show TextInputFormatter;

@immutable
final class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.prefixText,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String?>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffixIcon;

  @override
  TextFormField build(_) => TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    style:
        style?.copyWith(overflow: TextOverflow.fade) ??
        const TextStyle(overflow: TextOverflow.fade),
    textDirection: textDirection,
    textAlign: textAlign,
    obscuringCharacter: '৹', //⋇⊛৹⁕
    obscureText: obscureText,
    autocorrect: false,
    maxLines: maxLines,
    minLines: minLines,
    onChanged: onChanged,
    onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
    onEditingComplete: onEditingComplete,
    onFieldSubmitted: onFieldSubmitted,
    onSaved: onSaved,
    validator: validator,
    inputFormatters: inputFormatters,
    enabled: enabled,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      hintTextDirection: textDirection,
      prefixIcon: prefixIcon,
      prefixText: prefixText,
      suffixIcon: suffixIcon,
      constraints: const BoxConstraints(minHeight: 80 + 4),
    ),
  );
}

@immutable
final class AppTextFieldCollapsed extends StatelessWidget {
  const AppTextFieldCollapsed({
    super.key,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.hintText,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String?>? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final String? hintText;

  @override
  TextFormField build(_) => TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    style:
        style?.copyWith(overflow: TextOverflow.fade) ??
        const TextStyle(overflow: TextOverflow.fade),
    textDirection: textDirection,
    textAlign: textAlign,
    autocorrect: false,
    maxLines: maxLines,
    minLines: minLines,
    onChanged: onChanged,
    onTapOutside: (_) {
      onTapOutside?.call();
      FocusManager.instance.primaryFocus?.unfocus();
    },
    onEditingComplete: onEditingComplete,
    onFieldSubmitted: onFieldSubmitted,
    onSaved: onSaved,
    validator: validator,
    inputFormatters: inputFormatters,
    enabled: enabled,
    decoration: InputDecoration.collapsed(
      hintText: hintText,
      hintTextDirection: textDirection,
    ),
  );
}
