import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  IconData icon;
  String title;
  VoidCallback onPressed;
  DefaultAppBar({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 3,
      backgroundColor: kDefaultBackgroundColor,
      title: Text(
        title,
        style: kDetailsTitleTextStyle,
      ),
      leading: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: kDefaultBlack,
          size: 21,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
