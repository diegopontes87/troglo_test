import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/data/tests/entities/test_info_entity.dart';
import 'package:troglo_test/core/data/tests/entities/tests_result_entity.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';

abstract class TestsRepository {
  Future<Result<BaseHttpExceptions, TestsResultEntity>> getUserTestsResults();
  Future<Result<BaseHttpExceptions, List<TestInfoEntity>>> getTestsInfo();
}
