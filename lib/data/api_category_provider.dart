import '../constants/constants.dart';
import '../models/category_model.dart';
import '../services/api_requests.dart';

class CategoryProvider{
  Future<void> getCategory({
    Function()? beforeSend,
    required Function(CategoryResponse) onSuccess,
    required Function(dynamic error) onError,
  }) async {

    await ApiRequest(url: '${Constant.baseUrl}/api/category', data: null).get(
      beforeSend: () => {if (beforeSend != null) beforeSend()},

      onSuccess: (data) {

        var category = CategoryResponse.fromJson(data as Map<String, dynamic>);
        onSuccess(category);
      },
      onError: (error) => {if (onError != null) onError(error)},

    );
  }
}