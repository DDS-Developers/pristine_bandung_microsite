import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Blocs/FormEvent.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Blocs/FormState.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Models/AccessTokenModel.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Models/FormModel.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Models/PostalCodeModel.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Repositories/FormRepository.dart';

class FormBloc extends Bloc<FormEvent, FormStates> {
  final FormRepository formRepository;
  FormBloc(this.formRepository) : super(FormUninitialized());
  @override
  Stream<FormStates> mapEventToState(FormEvent event) async* {
    final storage = FlutterSecureStorage();
    if (event is GetListPostalCode) {
      yield PostalCodeListed(datasPostalCode: datasPostalCode);
      // try {
      //   PostalCodeModel postalCodeModel = await formRepository.getPostalCode();

      //   yield PostalCodeListed(postalCodeModel: postalCodeModel);
      // } catch (error) {
      //   yield PostalCodeFailed(error: error.toString());
      // }
    } else if (event is SubmitFormBtnPressed) {
      yield FormLoading();
      dynamic accessToken = await storage.read(key: 'access_token');
      try {
        ResponsFormModel responsFormModel;
        responsFormModel = await formRepository.submitForm(
            name: event.name,
            nik: event.nik,
            phone: event.phone,
            postalCode: event.postalCode,
            address: event.address,
            email: event.email,
            accesstoken: accessToken.toString());
        if (responsFormModel.statusCode == 200) {
          yield SubmitFormSucced(responsFormModel: responsFormModel);
        } else {
          yield SubmitFormFailed(error: responsFormModel.message);
        }
      } catch (error) {
        yield SubmitFormFailed(error: error.toString());
      }
    } else if (event is GenerateAccessToken) {
      AccessTokenModel accessTokenModel = await formRepository.getAccessToken();
      print('ACCESS TOKENYA ${accessTokenModel.token}');
      await storage.write(key: 'access_token', value: accessTokenModel.token);
    }
  }

  List<String> datasPostalCode = [
    "40973",
    "40972",
    "40921",
    "40914",
    "40915",
    "40913",
    "40911",
    "40912",
    "40626",
    "40625",
    "40624",
    "40623",
    "40622",
    "40621",
    "40619",
    "40618",
    "40617",
    "40616",
    "40611",
    "40615",
    "40614",
    "40396",
    "40395",
    "40394",
    "40386",
    "40385",
    "40384",
    "40383",
    "40382",
    "40381",
    "40379",
    "40378",
    "40377",
    "40376",
    "40375",
    "40258",
    "40374",
    "40294",
    "40295",
    "40292",
    "40293",
    "40291",
    "40288",
    "40287",
    "40267",
    "40266",
    "40256",
    "40286",
    "40281",
    "40285",
    "40284",
    "40283",
    "40282",
    "40275",
    "40274",
    "40273",
    "40272",
    "40271",
    "40257",
    "40239",
    "40238",
    "40265",
    "40264",
    "40263",
    "40262",
    "40261",
    "40255",
    "40254",
    "40253",
    "40252",
    "40251",
    "40243",
    "40242",
    "40241",
    "40237",
    "40235",
    "40236",
    "40234",
    "40232",
    "40233",
    "40231",
    "40229",
    "40228",
    "40226",
    "40225",
    "40227",
    "40224",
    "40222",
    "40223",
    "40221",
    "40218",
    "40216",
    "40217",
    "40215",
    "40214",
    "40213",
    "40212",
    "40211",
    "40198",
    "40196",
    "40197",
    "40195",
    "40191",
    "40192",
    "40125",
    "40124",
    "40121",
    "40123",
    "40122",
    "40184",
    "40182",
    "40183",
    "40181",
    "40175",
    "40174",
    "40173",
    "40171",
    "40172",
    "40163",
    "40164",
    "40162",
    "40161",
    "40154",
    "40152",
    "40153",
    "40151",
    "40142",
    "40143",
    "40141",
    "40134",
    "40135",
    "40132",
    "40133",
    "40131",
    "40117",
    "40112",
    "40113",
    "40111",
    "40116",
    "40114",
    "40115"
  ];
}
