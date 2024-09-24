import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dark_theme_color.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key, required this.text, this.showAction=false, this.actionText, this.onActionPressed});

  final String text;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10,),
          Text(text,style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
          const SizedBox(height: 10,),
          showAction?
          SizedBox(width: 250,
            child: OutlinedButton(
              onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor: DarkThemeColor.colorPrimaryDark),
              child: Text(actionText!,style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.red),),
            ),):
          const SizedBox()
        ],
      ),
    );
  }
}
