import 'package:blog_rivaan/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_rivaan/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:blog_rivaan/core/theme/app_pallete.dart';
class SignUpPage extends StatefulWidget {
   SignUpPage({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign up", style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
              ),
              SizedBox(height: 30,),
              AuthField(hintText: "Name"),
              SizedBox(height: 15,),
              AuthField(hintText: "E-mail"),
              SizedBox(height: 15,),
              AuthField(hintText: "Password"),
              SizedBox(height: 15,),
              AuthGradientButton(),
              SizedBox(height: 20,),
              RichText(text: TextSpan(text: "Don't have an account?",
              style: Theme.of(context).textTheme.titleMedium,
                children: [
                TextSpan(text: "Sign in?",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color:
                  AppPallete.gradient2,
                  fontWeight: FontWeight.bold,
                )
                ),
                ]
              )
          
              )
            ],
          ),
        ),
      ),
    );
  }
}
