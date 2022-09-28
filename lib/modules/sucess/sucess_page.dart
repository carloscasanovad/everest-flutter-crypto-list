import 'package:everest_flutter_crypto_list/shared/widgets/default_appbar.dart';
import 'package:flutter/material.dart';

import '../../shared/providers/asset_provider.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});
  static const route = 'success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
          title: '',
          onPressed: () {
            Navigator.of(context).pop();
          }),
      body: Center(
        child: Hero(
          tag: 'check',
          child: Image.asset(successIcon),
        ),
      ),
    );
  }
}
