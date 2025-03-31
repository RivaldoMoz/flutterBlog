import 'package:blog_rivaan/features/auth/presentation/auth_bloc.dart';
import 'package:blog_rivaan/features/auth/presentation/pages/sign_in.dart';
import 'package:blog_rivaan/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_rivaan/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:blog_rivaan/core/theme/app_pallete.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SignUpPage extends StatefulWidget {
   const SignUpPage({super.key});
   static route() => MaterialPageRoute(builder: (context)=> SignUpPage());


   @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              AuthField(hintText: "Name", controller: nameController,),
              SizedBox(height: 15,),
              AuthField(hintText: "E-mail", controller: emailController,),
              SizedBox(height: 15,),
              AuthField(hintText: "Password", controller: passwordController, isObscureText: true,),
              SizedBox(height: 15,),
              AuthGradientButton(
                onPressed: () {
                  if(formKey.currentState!.validate()){
                    context.read<AuthBloc>().add(AuthSignUp(
                        email: emailController.text.trim(),
                        name: nameController.text.trim(),
                        password: passwordController.text.trim()));
                  }
                },
                signInUpText: "Sign in",),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignInPage.route());
                },
                child: RichText(text: TextSpan(text: "Already have an account?  ",
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

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
