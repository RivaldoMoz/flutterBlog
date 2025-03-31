import 'package:blog_rivaan/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
Future <Either<Failure, String> >signUpWithPasswordEmail({
  required String name,
  required String email,
  required String password,
});

Future <Either<Failure, String> >signInWithPasswordEmail({
  required String email,
  required String password,
});
}