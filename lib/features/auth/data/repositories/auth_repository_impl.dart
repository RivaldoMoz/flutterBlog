import 'package:blog_rivaan/core/error/exceptios.dart';
import 'package:blog_rivaan/core/error/failure.dart';
import 'package:blog_rivaan/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_rivaan/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl(this.authRemoteDataSource);
  @override
  Future<Either<Failure, String>> signInWithPasswordEmail({
    required String email,
    required String password})async {
    try {
      final userId = await authRemoteDataSource.signInWithPasswordEmail(
          email: email,
          password: password
      );
      return right(userId);
    }
    on ServerException catch(e) {
      return left(Failure(e.message));
    }

  }

  @override
  Future<Either<Failure, String>> signUpWithPasswordEmail({
    required String name,
    required String email,
    required String password}) async {
    try {
      final userId = await authRemoteDataSource.signUpWithPasswordEmail(
          name: name,
          email: email,
          password: password
      );
      return right(userId);
    }
    on ServerException catch(e) {
      return left(Failure(e.message));
    }
  }


}