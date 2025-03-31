import 'package:blog_rivaan/features/auth/domain/usecases/user_signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _signUp;
  AuthBloc({required UserSignUp userSignUp}) : _signUp = userSignUp ,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final response = await _signUp(UserSignUParams(
          email: event.email,
          name: event.name,
          password: event.password,));
      response.fold((l)=> emit(AuthFailure(l.message)),
              (uid)=> emit(AuthSuccess(uid)));

    });
  }
}
