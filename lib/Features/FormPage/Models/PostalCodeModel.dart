class PostalCodeModel {
  String message;
  ResultPostalCode resultPostalCode;
  // List<DataPostalCode> dataPostalCode;

  PostalCodeModel({required this.message, required this.resultPostalCode});

  factory PostalCodeModel.fromJson(Map<String, dynamic> json) {
    return PostalCodeModel(
      message: json['message'],
      resultPostalCode: ResultPostalCode.fromJson(json['result']),
    );
  }
}

class ResultPostalCode {
  List<DataPostalCode> dataPostalCode;

  ResultPostalCode({required this.dataPostalCode});

  factory ResultPostalCode.fromJson(Map<String, dynamic> json) {
    return ResultPostalCode(
        dataPostalCode: parsedJsonDataPosCode(json['data']));
  }

  static List<DataPostalCode> parsedJsonDataPosCode(datasJson) {
    var list = datasJson as List;
    List<DataPostalCode> datasPostalCode =
        list.map((data) => DataPostalCode.fromJson(data)).toList();
    return datasPostalCode;
  }
}

class DataPostalCode {
  String name;
  String? postal;

  DataPostalCode({required this.name, required this.postal});

  factory DataPostalCode.fromJson(Map<String, dynamic> json) {
    return DataPostalCode(
      name: json['name_id'],
      postal: json['postal'],
    );
  }
}

// class JsonPostalCode {
//   List<String> listJsonPostalCode;

//   JsonPostalCode({required this.listJsonPostalCode});

//   factory JsonPostalCode.fromJson(Map<String, dynamic> json) {
//     return JsonPostalCode(
//         listJsonPostalCode: parsedJsonDataPosCode(json['data']));
//   }

//   static List<String> parsedJsonDataPosCode(datasJson) {
//     var list = datasJson as List;
//     List<String> datasPostalCode =
//         list.map((data) => DataPostalCode.fromJson(data)).toList();
//     return datasPostalCode;
//   }
// }
