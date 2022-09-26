import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(
          'https://assets3.lottiefiles.com/packages/lf20_debgr4jk.json'),
    );
  }
}
