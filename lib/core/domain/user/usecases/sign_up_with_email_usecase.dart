import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/data/user/entities/user_credentials_entity.dart';
import 'package:troglo_test/core/domain/user/repository/user_repository.dart';
import 'package:troglo_test/shared/infrastructure/base/base_firebase_exception.dart';
import 'package:troglo_test/shared/infrastructure/base/base_usecase.dart';

class SignUpWithEmailUsecase implements BaseFutureUsecase<UserCredentialsEntity, Result<AppFirebaseEmailAuthException, bool>> {
  UserRepository _repository;

  SignUpWithEmailUsecase(this._repository);
  @override
  Future<Result<AppFirebaseEmailAuthException, bool>> call(UserCredentialsEntity userInfo) async {
    return await _repository.signUpWithEmail(userInfo);
  }
}
