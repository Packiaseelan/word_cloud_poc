import 'package:flutter/material.dart';
import 'package:word_cloud_poc/config/app_theme.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final bool isTransparentBg;

  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isTransparentBg = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20.0),
      shadowColor: Colors.black,
      color: isTransparentBg ? Colors.transparent : AppTheme.secondaryColor,
      elevation: 10.0,
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}
