import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/data/user/entities/user_info_entity.dart';
import 'package:troglo_test/core/domain/user/repository/user_repository.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';
import 'package:troglo_test/shared/infrastructure/base/base_usecase.dart';

class SaveUserInfoUsecase implements BaseFutureUsecase<UserInfoEntity, Result<BaseHttpExceptions, bool>> {
  UserRepository _repository;

  SaveUserInfoUsecase(this._repository);
  @override
  Future<Result<BaseHttpExceptions, bool>> call(UserInfoEntity userInfo) async {
    return await _repository.saveUserInfo(userInfo);
  }
}
