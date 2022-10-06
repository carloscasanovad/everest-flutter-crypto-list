import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../model/review_arguments.dart';
import 'review_information.dart';

class BodyReviewPage extends StatelessWidget {
  ReviewArguments reviewArguments;
  BodyReviewPage({
    super.key,
    required this.reviewArguments,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Expanded(
            flex: 4,
            child: Text(
              AppLocalizations.of(context)!.confirmTitle,
              style: kTitle3TextStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: ReviewInformation(
              reviewArguments: reviewArguments,
            ),
          ),
        ],
      ),
    );
  }
}
