import 'package:blog_rivaan/core/error/exceptios.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithPasswordEmail({
    required String name,
    required String email,
    required String password,
  });
  Future<String> signInWithPasswordEmail({
    required String email,
    required String password,
  });
}
class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImp(this.supabaseClient);

  @override
  Future<String> signInWithPasswordEmail({
    required String email,
    required String password}) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null){
        throw const ServerException("The user is null");
      }
      return response.user!.id;
    }
    catch(e){
      throw ServerException(e.toString());
    }

  }

  @override
  Future<String> signUpWithPasswordEmail(
      {required String name, required String email,
        required String password}) async {
    try {
      final response = await supabaseClient.auth.signUp(
        data: {
          'name': name,
        },
        email: email,
        password: password,
      );
      if (response.user == null){
         throw const ServerException("The user is null");
      }
      return response.user!.id;
    }
    catch(e){
  throw ServerException(e.toString());
    }
  }
}