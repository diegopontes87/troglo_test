import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/data/user/entities/user_credentials_entity.dart';
import 'package:troglo_test/core/data/user/entities/user_info_entity.dart';
import 'package:troglo_test/shared/infrastructure/base/base_firebase_exception.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';

abstract class UserRepository {
  Future<Result<AppFirebaseEmailAuthException, bool>> loginWithEmail(UserCredentialsEntity userCredentials);
  Future<Result<AppFirebaseEmailAuthException, bool>> signUpWithEmail(UserCredentialsEntity userInfo);
  Future<Result<AppFirebaseEmailAuthException, bool>> signOut();
  Future<Result<BaseHttpExceptions, bool>> saveUserInfo(UserInfoEntity userInfoModel);
  Future<Result<BaseHttpExceptions, UserInfoEntity>> getUserInfo();
}
