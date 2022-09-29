import 'package:flutter/material.dart';

import 'package:everest_flutter_crypto_list/modules/review/model/review_arguments.dart';
import 'package:everest_flutter_crypto_list/modules/review/views/review_screen.dart';

import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../../../shared/widgets/default_appbar.dart';

class ReviewPage extends StatelessWidget {
  ReviewArguments reviewArguments;

  ReviewPage({
    Key? key,
    required this.reviewArguments,
  }) : super(key: key);

  static const route = 'review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Revisar',
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icons.arrow_back_ios_new_outlined,
      ),
      body: BodyReviewPage(
        reviewArguments: reviewArguments,
      ),
    );
  }
}
