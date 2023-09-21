import 'package:dio/dio.dart';
import 'package:it_zone_task/app/errors/failures.dart';

abstract class DioErrorHandler {
  Failure resolveErrors({required Response<dynamic> response});

  Failure throwDefaultFailure();
}

//{errors: [{title: email_not_confirmed, detail: Your email is not confirmed., status: bad_request}]} --> error response
class DioErrorHandlerImpl extends DioErrorHandler {
  @override
  Failure resolveErrors({required Response<dynamic> response}) {
    switch (response.statusCode) {
      case 500:
        return const DioInternalError(
          message: 'Internal server error',
          title: 'Error',
        );
      case 404:
        return const DioNotFoundError(
          message: 'Route not found',
          title: 'Not Found',
        );
      default:
        return const DioDefaultFailure(
          message: 'Default dio error',
          title: 'Default Error',
        );
    }
  }

  @override
  Failure throwDefaultFailure() {
    return const DioDefaultFailure(message: 'Something went wrong', title: 'Error');
  }
}
