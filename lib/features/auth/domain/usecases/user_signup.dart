import 'package:blog_rivaan/core/error/failure.dart';
import 'package:blog_rivaan/core/usecase/usecase.dart';
import 'package:blog_rivaan/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<String, UserSignUParams>  {
  final AuthRepository authRepository;
  UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignUParams params) async {
    return await authRepository.signUpWithPasswordEmail(
        name: params.name,
        email: params.email,
        password: params.password,
    );

  }
  }

class UserSignUParams {
  final String name;
  final String email;
  final String password;
  UserSignUParams({
    required this.email,
    required this.name,
    required this.password});
}