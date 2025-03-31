import 'package:blog_rivaan/features/auth/presentation/pages/sign_up.dart';
import 'package:blog_rivaan/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_rivaan/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:blog_rivaan/core/theme/app_pallete.dart';
class SignInPage extends StatefulWidget {
  SignInPage({super.key});
  final formKey = GlobalKey<FormState>();
  static route() => MaterialPageRoute(builder: (context)=> SignInPage());

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign in", style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
              ),

              SizedBox(height: 15,),
              AuthField(hintText: "E-mail", controller: emailController,),
              SizedBox(height: 15,),
              AuthField(hintText: "Password", controller: passwordController, isObscureText: true,),
              SizedBox(height: 15,),
              AuthGradientButton(
                onPressed: () {},
                signInUpText: "Sign in",),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignUpPage.route());
                },
                child: RichText(text: TextSpan(text: "Don't have an account?  ",
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(text: "Sign up?",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(color:
                          AppPallete.gradient2,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ]
                )

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
