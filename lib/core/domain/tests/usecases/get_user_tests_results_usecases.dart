import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/data/tests/entities/tests_result_entity.dart';
import 'package:troglo_test/core/domain/tests/repository/tests_repository.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';
import 'package:troglo_test/shared/infrastructure/base/base_usecase.dart';
import 'package:troglo_test/shared/infrastructure/entities/no_params.dart';

class GetUserTestsResultsUsecase implements BaseFutureUsecase<NoParams, Result<BaseHttpExceptions, TestsResultEntity>> {
  TestsRepository _repository;

  GetUserTestsResultsUsecase(this._repository);
  @override
  Future<Result<BaseHttpExceptions, TestsResultEntity>> call(NoParams input) async {
    return await _repository.getUserTestsResults();
  }
}
