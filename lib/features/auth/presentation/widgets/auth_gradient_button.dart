import 'package:flutter/material.dart';
import 'package:blog_rivaan/core/theme/app_pallete.dart';

class AuthGradientButton extends StatelessWidget {
  const AuthGradientButton({super.key, required this.signInUpText, required this.onPressed});
  final String signInUpText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors:
        [AppPallete.gradient1,
          AppPallete.gradient2,
        ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size(395, 55),
          backgroundColor: AppPallete.transparentColor,
          shadowColor: AppPallete.transparentColor,
        ),

        child:
        Text(signInUpText, style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),),
      ),
    );
  }
}
