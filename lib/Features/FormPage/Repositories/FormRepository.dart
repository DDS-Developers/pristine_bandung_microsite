import 'package:pristine_bandung_microsite/Features/FormPage/Models/AccessTokenModel.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Models/FormModel.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Models/PostalCodeModel.dart';
import 'package:pristine_bandung_microsite/Services/ApiProvider.dart';

class FormRepository {
  final apiProvider = ApiProvider();

  // Future<PostalCodeModel> getPostalCode() => apiProvider.getPostalCode();
  Future<ResponsFormModel> submitForm({
    required String name,
    required String nik,
    required String email,
    required String postalCode,
    required String address,
    required String phone,
    required String accesstoken,
  }) =>
      apiProvider.submitForm(
        name: name,
        nik: nik,
        email: email,
        postalCode: postalCode,
        address: address,
        phone: phone,
        accessToken: accesstoken,
      );

  Future<AccessTokenModel> getAccessToken() => apiProvider.getAccessToken();
}
