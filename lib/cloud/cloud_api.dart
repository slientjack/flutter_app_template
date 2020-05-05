import 'package:dio/dio.dart';

class CloudApi {

  static Map<String, String> baseUrls = {
    'user': 'https://test.yourhost.com/',
  };

  static Dio getDio(String module) {
    Dio dio = Dio();
    dio.options.baseUrl = baseUrls[module];
    dio.options.connectTimeout = 5000;  // 连接超时
    dio.options.receiveTimeout = 10000; // 响应超时
    // headers
    dio.options.headers['X-User-Agent'] = '...Your user agent';
    dio.options.headers['X-Accept-Language'] = 'zh_CN';
    dio.options.headers['Authorization'] = '...Your Authorization';
    return dio;
  }

  // 获取验证码
  static Future<Response> getVcode(String account, int type, String lang) async {
    Dio dio = getDio('user');
    Response resp = await dio.post('/vcode', 
      data: {
        "account": account, 
        "account_type": type, 
        "lang": lang
      }
    );
    return resp;
  }
}