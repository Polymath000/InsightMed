import 'package:flutter/material.dart'
    show
        BuildContext,
        ChoiceChip,
        EdgeInsets,
        Size,
        SizedBox,
        SliverPadding,
        SliverToBoxAdapter,
        StatelessWidget,
        TextAlign,
        TimeOfDay,
        Wrap;

import '../../../../../core/helpers/app_media_query.dart' show AppMediaQuery;
import '../../../../../core/utls/i_text.dart' show IText;

final class AppointmentsTimePicker extends StatelessWidget {
  const AppointmentsTimePicker({super.key});

  @override
  SliverPadding build(final BuildContext context) => SliverPadding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    sliver: SliverToBoxAdapter(
      child: Wrap(
        spacing: 8,
        children: List.generate(15, (final index) {
          final time = TimeOfDay(
            hour: (index / 2 + 9).toInt() % 24,
            minute: index.isEven ? 0 : 30,
          ).format(context);
          return SizedBox(
            width: (AppMediaQuery.width - 48) / 3,
            child: ChoiceChip(
              label: SizedBox.fromSize(
                size: const Size.fromHeight(22),
                child: IText(time, textAlign: TextAlign.center),
              ),
              selected: false,
              onSelected: (_) {},
            ),
          );
        }),
      ),
    ),
  );
}
