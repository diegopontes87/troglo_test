import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/domain/user/repository/user_repository.dart';
import 'package:troglo_test/shared/infrastructure/base/base_firebase_exception.dart';
import 'package:troglo_test/shared/infrastructure/base/base_usecase.dart';
import 'package:troglo_test/shared/infrastructure/entities/no_params.dart';

class SignOutUsecase implements BaseFutureUsecase<NoParams, Result<AppFirebaseEmailAuthException, bool>> {
  UserRepository _repository;

  SignOutUsecase(this._repository);
  @override
  Future<Result<AppFirebaseEmailAuthException, bool>> call(NoParams noParams) async {
    return await _repository.signOut();
  }
}
