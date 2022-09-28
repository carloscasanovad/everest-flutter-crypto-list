import 'package:flutter/material.dart';
import 'package:everest_flutter_crypto_list/modules/review/model/review_arguments.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/app_text_styles.dart';
import '../widgets/review_information.dart';

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
      appBar: AppBar(
        elevation: 3,
        backgroundColor: kDefaultBackgroundColor,
        title: const Text(
          'Revisar',
          style: kDetailsTitleTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kDefaultBlack,
            size: 21,
          ),
        ),
      ),
      body: Padding(
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
      ),
    );
  }
}
