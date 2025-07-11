import 'package:flutter/material.dart'
    show
        Card,
        Clip,
        Color,
        Column,
        CrossAxisAlignment,
        EdgeInsets,
        Icon,
        IconAlignment,
        IconData,
        Icons,
        ListTile,
        MainAxisSize,
        Padding,
        RoundedSuperellipseBorder,
        SliverPadding,
        SliverToBoxAdapter,
        StatelessWidget,
        TextButton,
        VoidCallback,
        Widget;

import '../../../../../core/constants/borders.dart' show AppBorders;
import '../../../../../core/utls/i_text.dart' show IText;
import '../../../../../core/utls/themes/app_colors.dart' show AppColors;

final class HomeSticker extends StatelessWidget {
  const HomeSticker({
    required this.headerIcon,
    required this.headerTitle,
    required this.headerColor,
    required this.bodyLeading,
    required this.bodyTitle,
    required this.bodySubTitle,
    this.bodyTrailing,
    this.bodyOnTap,
    this.paragraph,
    this.footerOnPressed,
    this.footerTitle,
    super.key,
  });
  final IconData headerIcon;
  final String headerTitle;
  final Color headerColor;
  final Widget bodyLeading;
  final String bodyTitle;
  final Widget bodySubTitle;
  final Widget? bodyTrailing;
  final VoidCallback? bodyOnTap;
  final Widget? paragraph;
  final VoidCallback? footerOnPressed;
  final String? footerTitle;

  @override
  SliverPadding build(_) => SliverPadding(
    padding: const EdgeInsets.all(16),
    sliver: SliverToBoxAdapter(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedSuperellipseBorder(borderRadius: AppBorders.xxs),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(headerIcon, color: AppColors.white),
              title: IText(headerTitle),
              tileColor: headerColor,
              textColor: AppColors.white,
            ),
            ListTile(
              leading: bodyLeading,
              title: IText(bodyTitle),
              subtitle: bodySubTitle,
              trailing: bodyTrailing,
              onTap: bodyOnTap,
              contentPadding: const EdgeInsets.only(left: 24, right: 32),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: paragraph,
            ),
            if (footerTitle != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextButton.icon(
                  onPressed: footerOnPressed,
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  label: IText(footerTitle!),
                  iconAlignment: IconAlignment.end,
                  style: TextButton.styleFrom(foregroundColor: headerColor),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
