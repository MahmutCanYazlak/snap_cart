import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/core/models/auth/user_model.dart';
import 'package:snap_cart/core/resources/data_state.dart';
import 'package:snap_cart/features/auth/repository/auth_repository.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository);
});

class AuthController {
  final AuthRepository _authRepository;

  AuthController(this._authRepository);

  Future<DataState<UserModel>> login({
    required String email,
    required String password,
  }) async {
    final result =
        await _authRepository.login(email: email, password: password);
    return result;
  }
}
