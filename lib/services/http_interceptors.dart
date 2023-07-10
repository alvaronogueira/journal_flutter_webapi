import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {
  Logger logger = Logger();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    logger.v(
        "Request for ${data.baseUrl}\nHeader: ${data.headers}\nBody: ${data.body}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    logger.i(
        "Response to ${data.url}\nHeader: ${data.headers}\nBody: ${data.body}");
    return data;
  }
}
