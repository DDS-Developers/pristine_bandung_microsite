import 'package:equatable/equatable.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Models/FormModel.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Models/PostalCodeModel.dart';

abstract class FormStates extends Equatable {
  @override
  List<Object> get props => [];
}

class FormUninitialized extends FormStates {}

class FormLoading extends FormStates {}

class SubmitFormSucced extends FormStates {
  final ResponsFormModel responsFormModel;
  SubmitFormSucced({required this.responsFormModel});
  @override
  List<Object> get props => [responsFormModel];
}

class SubmitFormFailed extends FormStates {
  final String error;
  SubmitFormFailed({required this.error});
  @override
  List<Object> get props => [error];
}

class PostalCodeListed extends FormStates {
  // final PostalCodeModel postalCodeModel;
  final List<String> datasPostalCode;
  PostalCodeListed({required this.datasPostalCode});
  @override
  List<Object> get props => [datasPostalCode];
}

class PostalCodeFailed extends FormStates {
  final String error;
  PostalCodeFailed({required this.error});
  @override
  List<Object> get props => [error];
}
