class AppHttp {
  //BASE URL
  static const String baseDevUrl = 'https://us-central1-troglo-back-test.cloudfunctions.net/webApi';

  //ENDPOINTS
  static const String testsResults = '/testsresults';
  static const String orders = '/orders';
  static const String testsKit = '/testskit';
  static const String userInfo = '/userinfo';

  //HTTP ERROR
  static const networkErrorCode = 'SocketException';
}
