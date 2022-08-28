class ResponsFormModel {
  String message;
  int statusCode;
  DataFormModel? data;

  ResponsFormModel(
      {required this.message, required this.statusCode, this.data});

  factory ResponsFormModel.fromJson(Map<String, dynamic> json) {
    if (json['code'] == 200) {
      return ResponsFormModel(
        message: json['message'],
        statusCode: json['code'],
        data: DataFormModel.fromJson(json['data']),
      );
    } else {
      return ResponsFormModel(
        message: json['message'],
        statusCode: json['code'],
      );
    }
  }
}

class DataFormModel {
  String name;
  String nik;
  String uniqueCode;

  DataFormModel(
      {required this.name, required this.nik, required this.uniqueCode});

  factory DataFormModel.fromJson(Map<String, dynamic> json) {
    return DataFormModel(
      name: json['name'],
      nik: json['nik'],
      uniqueCode: json['unique_code'],
    );
  }
}
