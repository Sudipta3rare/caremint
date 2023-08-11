import '../constants/constants.dart';
import '../services/api_requests.dart';

class SignUpProvider{
  Future<void> postSignUpRes({
    Function()? beforeSend,
    required Function(dynamic success) onSuccess,
    required Function(dynamic error) onError,
    required dynamic data,
  }) async {

    ApiRequest(url: '${Constant.baseUrl}/api/user-signup', frmData: data).post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {

        onSuccess(data);

      },
      onError: (error) => {

        if (onError != null) onError(error)},
    );
  }
}