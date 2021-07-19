import 'package:troglo_test/core/data/tests/data_source/remote_data_source/tests_remote_data_source.dart';
import 'package:troglo_test/core/data/tests/entities/test_info_entity.dart';
import 'package:troglo_test/core/data/tests/entities/tests_result_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/domain/tests/repository/tests_repository.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';

class TestsRepositoryImplementation implements TestsRepository {
  TestsRemoteDataSource _remoteDataSource;

  TestsRepositoryImplementation(this._remoteDataSource);

  @override
  Future<Result<BaseHttpExceptions, List<TestInfoEntity>>> getTestsInfo() async {
    return await _remoteDataSource.getTestsInfo();
  }

  @override
  Future<Result<BaseHttpExceptions, TestsResultEntity>> getUserTestsResults() async {
    return await _remoteDataSource.getUserTestsResults();
  }
}
