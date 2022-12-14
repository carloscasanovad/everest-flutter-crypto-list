import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/app_colors.dart';

class DefaultLoadingSpinner extends StatelessWidget {
  const DefaultLoadingSpinner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitFadingCube(
        color: kDefaultRed,
        size: 50.0,
      ),
    );
  }
}
