import 'package:swift_shop/features/profile/domain/models/user_model.dart';
import '../../../../core/utils/typedefs.dart';

abstract class AuthRepo {
  ResultFuture<void> register({
    required String name,
    required String password,
    required String email,
    required String phone,
  });

  ResultFuture<UserModel> login({
    required String email,
    required String password,
  });

  ResultFuture<void> forgotPassword(String email);

  ResultFuture<void> verifyOTP({
    required String email,
    required String otp,
  });

  ResultFuture<void> resetPassword({
    required String email,
    required String newPassword,
  });

  ResultFuture<bool> verifyToken();
}
