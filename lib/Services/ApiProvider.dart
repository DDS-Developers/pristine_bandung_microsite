import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:pristine_bandung_microsite/Features/FormPage/Models/AccessTokenModel.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Models/FormModel.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Models/PostalCodeModel.dart';

class ApiProvider {
  Client client = Client();

  Future<ResponsFormModel> submitForm({
    required String name,
    required String nik,
    required String email,
    required String postalCode,
    required String address,
    required String phone,
    required String accessToken,
  }) async {
    print('INI NIK $accessToken');

    // final responseAccessToken = await client.get(
    //   Uri.parse(
    //       'https://api.pristineofficial.com/api/bandung_submission/generate_token'),
    //   headers: {
    //     'Content-Type': 'application/json',
    //   },
    // );

    // AccessTokenModel accessTokenModel =
    //     AccessTokenModel.fromJson(json.decode(responseAccessToken.body));

    Map _jsonMap = {
      'name': name,
      'nik': nik,
      'email': email,
      'city': 'Bandung',
      'postal_code': postalCode,
      'address': address,
      'phone': phone,
      'token': accessToken
    };
    final response = await client.post(
      Uri.parse('https://api.pristineofficial.com/api/bandung_submission'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(_jsonMap),
    );
    print('SUBMIT FORM ${response.body}');
    ResponsFormModel getChangePassModel;

    if (response.statusCode == 200) {
      getChangePassModel =
          ResponsFormModel.fromJson(json.decode(response.body));
      return getChangePassModel;
    } else {
      getChangePassModel =
          ResponsFormModel.fromJson(json.decode(response.body));
      throw 'Error ${response.statusCode}. ${getChangePassModel.message}';
    }
  }

  Future<AccessTokenModel> getAccessToken() async {
    final response = await client.get(
      Uri.parse(
          'https://api.pristineofficial.com/api/bandung_submission/generate_token'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    AccessTokenModel accessTokenModel;
    if (response.statusCode == 200) {
      accessTokenModel = AccessTokenModel.fromJson(json.decode(response.body));

      return accessTokenModel;
    } else {
      accessTokenModel = AccessTokenModel.fromJson(json.decode(response.body));
      throw 'Error ${response.statusCode}. ${accessTokenModel.statusCode}';
    }
  }

  // Future<PostalCodeModel> getPostalCode() async {
  //   final response = await client.get(
  //       Uri.parse(
  //           'https://api.pristineofficial.com/api/location/sub_district?district_id=740&all=true'),
  //       headers: {"Access-Control_Allow_Origin": "*"});
  //   print('GET POSTAL CODE ${response.body}');

  //   if (response.statusCode == 200) {
  //     PostalCodeModel getChangePassModel =
  //         PostalCodeModel.fromJson(json.decode(response.body));
  //     return getChangePassModel;
  //   } else {
  //     throw 'Error ${response.statusCode}. Terjadi Kendala';
  //   }
  // }

  // Future<PostalCodeModel> getPostalCode() async {
  //   final response = await client.get(
  //       Uri.parse(
  //           'https://api.pristineofficial.com/api/location/sub_district?district_id=740&all=true'),
  //       headers: {"Access-Control_Allow_Origin": "*"});
  //   print('GET POSTAL CODE ${response.body}');

  //   if (response.statusCode == 200) {
  //     PostalCodeModel getChangePassModel =
  //         PostalCodeModel.fromJson(json.decode(response.body));
  //     return getChangePassModel;
  //   } else {
  //     throw 'Error ${response.statusCode}. Terjadi Kendala';
  //   }
  // }
}
