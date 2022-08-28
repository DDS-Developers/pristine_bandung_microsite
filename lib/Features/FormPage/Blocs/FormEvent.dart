import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FormInitial extends FormEvent {}

class SubmitFormBtnPressed extends FormEvent {
  final String name;
  final String nik;
  final String email;
  final String postalCode;
  final String address;
  final String phone;

  SubmitFormBtnPressed({
    required this.name,
    required this.nik,
    required this.email,
    required this.postalCode,
    required this.address,
    required this.phone,
  });
}

class GetListPostalCode extends FormEvent {}

class GenerateAccessToken extends FormEvent {}
