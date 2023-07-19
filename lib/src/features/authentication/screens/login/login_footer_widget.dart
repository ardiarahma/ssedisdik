import 'package:flutter/material.dart';

import '../../../../constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          tFooterDev,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.color!
                  .withAlpha(128)),
          textAlign: TextAlign.center,
        ),
        Text(tFooterDisdik,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.color!
                    .withAlpha(128)),
            textAlign: TextAlign.center),
      ],
    );
  }
}
