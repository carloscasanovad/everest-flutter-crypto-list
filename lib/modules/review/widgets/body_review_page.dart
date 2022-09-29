import 'package:flutter/material.dart';

import '../../../shared/constants/app_text_styles.dart';
import '../model/review_arguments.dart';
import '../widgets/review_information.dart';

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
        children: [
          const Expanded(
            flex: 4,
            child: Text(
              'Revise os dados da sua conversão',
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
