import 'package:blog_rivaan/core/secrets/app_secrets.dart';
import 'package:blog_rivaan/core/theme/app_pallete.dart';
import 'package:blog_rivaan/core/theme/theme.dart';
import 'package:blog_rivaan/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_rivaan/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_rivaan/features/auth/domain/usecases/user_signup.dart';
import 'package:blog_rivaan/features/auth/presentation/auth_bloc.dart';
import 'package:blog_rivaan/features/auth/presentation/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await  Supabase.initialize(
      url: AppSecrets.supabaseKey,
      anonKey: AppSecrets.supabaseKey);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=> AuthBloc(userSignUp:
      UserSignUp(
          AuthRepositoryImpl(AuthRemoteDataSourceImp(supabase.client),),
      ),),),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode.copyWith(
        scaffoldBackgroundColor: AppPallete.backgroundColor,
      ),
      home: SignInPage(),
    );
  }
}

