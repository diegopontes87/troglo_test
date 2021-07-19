import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/data/tests/entities/test_info_entity.dart';
import 'package:troglo_test/core/domain/tests/repository/tests_repository.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';
import 'package:troglo_test/shared/infrastructure/base/base_usecase.dart';
import 'package:troglo_test/shared/infrastructure/entities/no_params.dart';

class GetTestsInfoUsecase implements BaseFutureUsecase<NoParams, Result<BaseHttpExceptions, List<TestInfoEntity>>> {
  TestsRepository _repository;

  GetTestsInfoUsecase(this._repository);

  @override
  Future<Result<BaseHttpExceptions, List<TestInfoEntity>>> call(NoParams input) async {
    return await _repository.getTestsInfo();
  }
}
