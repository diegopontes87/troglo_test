import 'package:troglo_test/core/data/user/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:troglo_test/core/data/user/entities/user_info_entity.dart';
import 'package:troglo_test/core/data/user/entities/user_credentials_entity.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:troglo_test/core/domain/user/repository/user_repository.dart';
import 'package:troglo_test/shared/infrastructure/base/base_http_exceptions.dart';
import 'package:troglo_test/shared/infrastructure/base/base_firebase_exception.dart';

class UserRepositoryImplementation implements UserRepository {
  UserRemoteDataSource _remoteDataSource;

  UserRepositoryImplementation(this._remoteDataSource);
  @override
  Future<Result<BaseHttpExceptions, UserInfoEntity>> getUserInfo() async {
    return await _remoteDataSource.getUserInfo();
  }

  @override
  Future<Result<AppFirebaseEmailAuthException, bool>> loginWithEmail(UserCredentialsEntity userCredentials) async {
    return await _remoteDataSource.loginWithEmail(userCredentials);
  }

  @override
  Future<Result<BaseHttpExceptions, bool>> saveUserInfo(UserInfoEntity userInfoModel) async {
    return await _remoteDataSource.saveUserInfo(userInfoModel);
  }

  @override
  Future<Result<AppFirebaseEmailAuthException, bool>> signOut() async {
    return await _remoteDataSource.signOut();
  }

  @override
  Future<Result<AppFirebaseEmailAuthException, bool>> signUpWithEmail(UserCredentialsEntity userInfo) async {
    return await _remoteDataSource.signUpWithEmail(userInfo);
  }
}
