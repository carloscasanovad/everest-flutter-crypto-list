import 'package:everest_flutter_crypto_list/modules/sucess/sucess_page.dart';
import 'package:flutter/material.dart';
import '../../../shared/constants/app_colors.dart';

class ReviewInformationButton extends StatelessWidget {
  ReviewInformationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 46,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, SuccessPage.route);
        },
        minWidth: MediaQuery.of(context).size.width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: kDefaultRed),
        ),
        color: kDefaultRed,
        child: const Text(
          'Concluir Conversão',
          style: TextStyle(
            fontSize: 17,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}
