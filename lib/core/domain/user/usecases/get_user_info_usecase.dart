import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/data/user/entities/user_info_entity.dart';
import 'package:troglo_test/core/domain/user/repository/user_repository.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';
import 'package:troglo_test/shared/infrastructure/base/base_usecase.dart';
import 'package:troglo_test/shared/infrastructure/entities/no_params.dart';

class GetUserInfoUsecase implements BaseFutureUsecase<NoParams, Result<BaseHttpExceptions, UserInfoEntity>> {
  UserRepository _repository;

  GetUserInfoUsecase(this._repository);
  @override
  Future<Result<BaseHttpExceptions, UserInfoEntity>> call(NoParams noParams) async {
    return await _repository.getUserInfo();
  }
}
