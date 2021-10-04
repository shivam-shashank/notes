import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes/features/note/domain/use_cases/get_current_uid_use_case.dart';
import 'package:notes/features/note/domain/use_cases/is_sign_in_use_case.dart';
import 'package:notes/features/note/domain/use_cases/sign_out_use_case.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUidUseCase getCurrentUidUseCase;
  final SignOutUseCase signOutUseCase;

  AuthCubit(
      {required this.isSignInUseCase,
      required this.getCurrentUidUseCase,
      required this.signOutUseCase})
      : super(AuthInitial());

  Future<void> appStarted() async {
    try {
      final _isSignIn = await isSignInUseCase.call();
      if (_isSignIn) {
        final _uid = await getCurrentUidUseCase.call();
        emit(Authenticated(uid: _uid));
      } else {
        emit(UnAuthenticated());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUidUseCase.call();
      emit(Authenticated(uid: uid));
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    }
  }

  Future<void> loggedOut() async {
    try {
      await signOutUseCase.call();
      emit(UnAuthenticated());
    } on SocketException catch (_) {
      emit(UnAuthenticated());
    }
  }
}
