// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pristine_bandung_microsite/Core/Navigation/NavigationBloc.dart';
import 'package:pristine_bandung_microsite/Core/Navigation/NavigationEvent.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Blocs/FormBloc.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Blocs/FormEvent.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Blocs/FormState.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Models/PostalCodeModel.dart';
import 'package:pristine_bandung_microsite/Features/FormPage/Repositories/FormRepository.dart';
import 'package:pristine_bandung_microsite/Widgets/CustomAlertDialog.dart';
import 'package:pristine_bandung_microsite/Widgets/CustomDialogSuccess.dart';
import 'package:pristine_bandung_microsite/Widgets/HeaderWidget.dart';

class FormPage extends StatefulWidget {
  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ktpCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController phoneNumbCtrl = TextEditingController();
  String postalCode = "";
  Color defaultColor = Color(0xFF2ea49d);
  final _formKey = GlobalKey<FormState>();
  bool valueAgreement = false;
  TextStyle textStylesAlert = TextStyle(
      fontWeight: FontWeight.w300, fontSize: 12, color: Color(0xFF2ea49d));
  TextStyle textStylesField = TextStyle(
      fontWeight: FontWeight.w300, fontSize: 13, color: Color(0xFF2ea49d));
  TextStyle textStylesFieldWeb = TextStyle(
      fontWeight: FontWeight.w300, fontSize: 23, color: Color(0xFF2ea49d));
  TextStyle textInputStylesField =
      TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Colors.black);
  Padding paddingStyle = Padding(
    padding: EdgeInsets.only(top: 25, right: 20, left: 20),
  );
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width <= 425
        ? MultiBlocProvider(
            providers: [
              BlocProvider<FormBloc>(
                  create: (context) => FormBloc(
                        RepositoryProvider.of<FormRepository>(context),
                      )),
            ],
            child: MultiBlocListener(
                listeners: [
                  BlocListener<FormBloc, FormStates>(
                    listener: (context, state) {
                      print("APA LISTENERNYA $state");
                      if (state is SubmitFormFailed) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return CustomAlertDialog(
                              alertType: AlertType.error,
                              title: 'Gagal !',
                              subtitle: state.error,
                              mainButtonText: 'OK',
                              mainButtonOnTap: () {
                                BlocProvider.of<NavigationBloc>(context)
                                    .add(NavigationPopped());
                              },
                            );
                          },
                        );
                      } else if (state is SubmitFormSucced) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    super.widget));
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext contexts) {
                            return CustomDialogSucces(
                              contextBloc: context,
                              name: state.responsFormModel.data!.name,
                              voucherCode:
                                  state.responsFormModel.data!.uniqueCode,
                            );
                          },
                        );
                      }
                      // else {
                      //   showDialog(
                      //     context: context,
                      //     barrierDismissible: false,
                      //     builder: (BuildContext contexts) {
                      //       return CustomDialogSucces(
                      //         contextBloc: context,
                      //         name: "COBAA COBAA",
                      //         voucherCode: "ABJCN0909",
                      //       );
                      //     },
                      //   );
                      // }
                    },
                  ),
                ],
                child: BlocBuilder<FormBloc, FormStates>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/gedung_background.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            appBar: PreferredSize(
                                preferredSize: const Size.fromHeight(60),
                                child: headerWidget(context)),
                            body: Form(
                              key: _formKey,
                              child: ListView(
                                children: [
                                  Image.asset(
                                    'assets/hadiah.jpg',
                                    scale: 0.1,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Text(
                                        'Isi data di bawah ini : ',
                                        style: textStylesField,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, right: 20, left: 20),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            'Nama*',
                                            style: textStylesField,
                                          ),
                                        ),
                                        Container(
                                          width: 10,
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(':'),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 35,
                                            margin: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: defaultColor),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.next,
                                              autofocus: false,
                                              style: textInputStylesField,
                                              controller: nameCtrl,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    top: 3, left: 10),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                              ),
                                              // validator: (value) {
                                              //   if (value == null || value.isEmpty) {
                                              //     return 'Nama wajib di isi!';
                                              //   }
                                              //   return null;
                                              // },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 20, left: 20),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            'No.KTP (NIK)*',
                                            style: textStylesField,
                                          ),
                                        ),
                                        Container(
                                          width: 10,
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(':'),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 35,
                                            margin: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: defaultColor),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              textInputAction:
                                                  TextInputAction.next,
                                              autofocus: false,
                                              style: textInputStylesField,
                                              controller: ktpCtrl,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    top: 3, left: 10),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                              ),
                                              // validator: (value) {
                                              //   if (value == null || value.isEmpty) {
                                              //     return 'No KTP wajib di isi!';
                                              //   }
                                              //   return null;
                                              // },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 20, left: 20),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            'Email*',
                                            style: textStylesField,
                                          ),
                                        ),
                                        Container(
                                          width: 10,
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(':'),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 35,
                                            margin: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: defaultColor),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              textInputAction:
                                                  TextInputAction.next,
                                              autofocus: false,
                                              style: textInputStylesField,
                                              controller: emailCtrl,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    top: 3, left: 10),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                              ),
                                              // validator: (value) {
                                              //   if (value == null || value.isEmpty) {
                                              //     return 'Email wajib di isi!';
                                              //   }
                                              //   return null;
                                              // },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 20, left: 20),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            'Kota*',
                                            style: textStylesField,
                                          ),
                                        ),
                                        Container(
                                          width: 10,
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(':'),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 35,
                                            margin: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Color(0xFF2ea49d)),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.next,
                                              initialValue: "Bandung",
                                              enabled: false,
                                              style: textInputStylesField,
                                              decoration: InputDecoration(
                                                filled: true,
                                                contentPadding: EdgeInsets.only(
                                                    top: 3, left: 10),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Kota wajib di isi!';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  BlocProvider<FormBloc>(
                                    create: (context) => FormBloc(
                                        RepositoryProvider.of<FormRepository>(
                                            context))
                                      ..add(GetListPostalCode()),
                                    child: BlocBuilder<FormBloc, FormStates>(
                                      builder: (context, state) {
                                        if (state is PostalCodeListed) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, right: 20, left: 20),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: 100,
                                                  child: Text(
                                                    'Kode Pos*',
                                                    style: textStylesField,
                                                  ),
                                                ),
                                                Container(
                                                  width: 10,
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text(':'),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 35,
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: defaultColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    child:
                                                        DropdownSearch<String>(
                                                      showSearchBox: true,
                                                      mode: Mode.MENU,
                                                      label: "",
                                                      dropDownButton: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 5.0),
                                                        child: Icon(
                                                            Icons
                                                                .arrow_drop_down,
                                                            color: Color(
                                                                0xFF08a396)),
                                                      ),
                                                      dropdownSearchDecoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                bottom: 5,
                                                                left: 10),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            width: 0,
                                                            style: BorderStyle
                                                                .none,
                                                          ),
                                                        ),
                                                      ),
                                                      onFind: (String
                                                          filter) async {
                                                        var dataPosCode = state
                                                            .datasPostalCode;
                                                        return dataPosCode;
                                                      },
                                                      itemAsString:
                                                          (String? u) =>
                                                              u!.toString(),
                                                      onChanged:
                                                          (String? data) {
                                                        setState(() {
                                                          postalCode =
                                                              data!.toString();
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20, left: 20),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 100,
                                                child: Text(
                                                  'Kode Pos*',
                                                  style: textStylesField,
                                                ),
                                              ),
                                              Container(
                                                width: 10,
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(':'),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 35,
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: defaultColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    autofocus: false,
                                                    style: textInputStylesField,
                                                    // controller: postalCodeCtrl,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              top: 3, left: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide: BorderSide(
                                                          width: 0,
                                                          style:
                                                              BorderStyle.none,
                                                        ),
                                                      ),
                                                    ),
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'Kode pos wajib di isi!';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 20, left: 20),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            'Alamat',
                                            style: textStylesField,
                                          ),
                                        ),
                                        Container(
                                          width: 10,
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(':'),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 35,
                                            margin: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: defaultColor),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.next,
                                              style: textInputStylesField,
                                              minLines: 1,
                                              maxLines: 3,
                                              controller: addressCtrl,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    top: 3, left: 10),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                              ),
                                              // validator: (value) {
                                              //   if (value == null || value.isEmpty) {
                                              //     return 'Alamat wajib di isi!';
                                              //   }
                                              //   return null;
                                              // },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 20, left: 20),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            'No Whatsapp*',
                                            style: textStylesField,
                                          ),
                                        ),
                                        Container(
                                          width: 10,
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(':'),
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 35,
                                            margin: EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: defaultColor),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              textInputAction:
                                                  TextInputAction.next,
                                              autofocus: false,
                                              style: textInputStylesField,
                                              controller: phoneNumbCtrl,
                                              decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(
                                                    top: 3, left: 10),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                              ),
                                              // validator: (value) {
                                              //   if (value == null || value.isEmpty) {
                                              //     return 'No handpone wajib di isi!';
                                              //   }
                                              //   return null;
                                              // },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 10),
                                  //   child: SizedBox(
                                  //     height: 35,
                                  //     child: TextFormField(
                                  //       keyboardType: TextInputType.text,
                                  //       textInputAction: TextInputAction.next,
                                  //       controller: vocucherCodeCtrl,
                                  //       decoration: InputDecoration(
                                  //         fillColor: Colors.white,
                                  //         filled: true,
                                  //         contentPadding: EdgeInsets.fromLTRB(10, 35, 10, 0),
                                  //         focusedBorder: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.circular(30),
                                  //           borderSide: BorderSide(
                                  //             color: Color(0xFF08a396),
                                  //             width: 1,
                                  //             // style: BorderStyle.none,
                                  //           ),
                                  //         ),
                                  //         enabledBorder: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.circular(30),
                                  //           borderSide: BorderSide(
                                  //             color: Color(0xFF08a396),
                                  //             width: 1,
                                  //             // style: BorderStyle.none,
                                  //           ),
                                  //         ),
                                  //         border: OutlineInputBorder(
                                  //           borderRadius: BorderRadius.circular(30),
                                  //           borderSide: BorderSide(
                                  //             color: Color(0xFF08a396),
                                  //             width: 1,
                                  //             // style: BorderStyle.none,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //       validator: (value) {
                                  //         if (value == null || value.isEmpty) {
                                  //           return 'Kode voucher wajib di isi!';
                                  //         }
                                  //         return null;
                                  //       },
                                  //     ),
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: Text(
                                      '*Wajib diisi',
                                      style: textStylesAlert,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 20, left: 10, right: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Transform.scale(
                                          scale: 0.8,
                                          child: Checkbox(
                                            value: valueAgreement,
                                            side: MaterialStateBorderSide
                                                .resolveWith(
                                              (states) => BorderSide(
                                                  width: 2.0,
                                                  color: defaultColor),
                                            ),
                                            onChanged: (bool? value) {
                                              setState(() {
                                                valueAgreement = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4),
                                            child: Text(
                                              'Saya menyetujui untuk menerima segala bentuk info dan promosi dari Pristine8.6+ dalam bentuk email, panggilan, maupun SMS',
                                              style: textStylesAlert,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // BlocProvider<FormBloc>(
                                  //   create: (context) => FormBloc(
                                  //       RepositoryProvider.of<FormRepository>(context)),
                                  //   child: BlocBuilder<FormBloc, FormStates>(
                                  //     builder: (context, state) {
                                  //       return
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        if (_formKey.currentState!.validate() &&
                                            valueAgreement == true &&
                                            postalCode != "") {
                                          setState(() {
                                            defaultColor = Color(0xFF2ea49d);
                                          });
                                          BlocProvider.of<FormBloc>(context)
                                              .add(SubmitFormBtnPressed(
                                                  name: nameCtrl.text,
                                                  nik: ktpCtrl.text,
                                                  postalCode: postalCode,
                                                  address: addressCtrl.text,
                                                  phone: phoneNumbCtrl.text,
                                                  email: emailCtrl.text));
                                        } else {
                                          setState(() {
                                            defaultColor = Color(0xFFeb4034);
                                          });
                                        }
                                      },
                                      child: Container(
                                        height: 35.0,
                                        width: 105,
                                        margin: EdgeInsets.only(
                                            top: 30.0, bottom: 20.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'KIRIM',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xFF08a396),
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 3),
                                              child: CircleAvatar(
                                                radius: 14,
                                                backgroundColor:
                                                    Color(0xFF08a396),
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 14,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  //     },
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )),
          )
        : MultiBlocProvider(
            providers: [
              BlocProvider<FormBloc>(
                  create: (context) => FormBloc(
                        RepositoryProvider.of<FormRepository>(context),
                      )),
            ],
            child: MultiBlocListener(
              listeners: [
                BlocListener<FormBloc, FormStates>(
                  listener: (context, state) {
                    print("APA LISTENERNYA $state");
                    if (state is SubmitFormFailed) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return CustomAlertDialog(
                            alertType: AlertType.error,
                            title: 'Gagal !',
                            subtitle: state.error,
                            mainButtonText: 'OK',
                            mainButtonOnTap: () {
                              BlocProvider.of<NavigationBloc>(context)
                                  .add(NavigationPopped());
                            },
                          );
                        },
                      );
                    } else if (state is SubmitFormSucced) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => super.widget));
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext contexts) {
                          return CustomDialogSucces(
                            contextBloc: context,
                            name: state.responsFormModel.data!.name,
                            voucherCode:
                                state.responsFormModel.data!.uniqueCode,
                          );
                        },
                      );
                    }
                    // else {
                    //   showDialog(
                    //     context: context,
                    //     barrierDismissible: false,
                    //     builder: (BuildContext contexts) {
                    //       return CustomDialogSucces(
                    //         contextBloc: context,
                    //         name: "COBAA COBAA",
                    //         voucherCode: "ABJCN0909",
                    //       );
                    //     },
                    //   );
                    // }
                  },
                ),
              ],
              child: BlocBuilder<FormBloc, FormStates>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/gedung_background.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Scaffold(
                          backgroundColor: Colors.transparent,
                          appBar: PreferredSize(
                              preferredSize: const Size.fromHeight(60),
                              child: headerWidget(context)),
                          body: Form(
                            key: _formKey,
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 40),
                                        child: Image.asset(
                                          'assets/hadiah.jpg',
                                          scale: 0.52,
                                          // width: 600,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                        child: Column(
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 50),
                                            child: Text(
                                              'Isi data di bawah ini : ',
                                              style: textStylesFieldWeb,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 25, right: 20, left: 20),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 190,
                                                child: Text(
                                                  'Nama*',
                                                  style: textStylesFieldWeb,
                                                ),
                                              ),
                                              Container(
                                                width: 10,
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(':'),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 50,
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: defaultColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    autofocus: false,
                                                    style: textInputStylesField,
                                                    controller: nameCtrl,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              top: 3, left: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide: BorderSide(
                                                          width: 0,
                                                          style:
                                                              BorderStyle.none,
                                                        ),
                                                      ),
                                                    ),
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'Nama wajib di isi!';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20, left: 20),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 190,
                                                child: Text(
                                                  'No.KTP (NIK)*',
                                                  style: textStylesFieldWeb,
                                                ),
                                              ),
                                              Container(
                                                width: 10,
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(':'),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 50,
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: defaultColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    autofocus: false,
                                                    style: textInputStylesField,
                                                    controller: ktpCtrl,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              top: 3, left: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide: BorderSide(
                                                          width: 0,
                                                          style:
                                                              BorderStyle.none,
                                                        ),
                                                      ),
                                                    ),
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'No KTP wajib di isi!';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20, left: 20),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 190,
                                                child: Text(
                                                  'Email*',
                                                  style: textStylesFieldWeb,
                                                ),
                                              ),
                                              Container(
                                                width: 10,
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(':'),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 50,
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: defaultColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: TextFormField(
                                                    keyboardType: TextInputType
                                                        .emailAddress,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    autofocus: false,
                                                    style: textInputStylesField,
                                                    controller: emailCtrl,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              top: 3, left: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide: BorderSide(
                                                          width: 0,
                                                          style:
                                                              BorderStyle.none,
                                                        ),
                                                      ),
                                                    ),
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'Email wajib di isi!';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20, left: 20),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 190,
                                                child: Text(
                                                  'Kota*',
                                                  style: textStylesFieldWeb,
                                                ),
                                              ),
                                              Container(
                                                width: 10,
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(':'),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 50,
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color:
                                                            Color(0xFF2ea49d)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    initialValue: "Bandung",
                                                    enabled: false,
                                                    style: textInputStylesField,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              top: 3, left: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide: BorderSide(
                                                          width: 0,
                                                          style:
                                                              BorderStyle.none,
                                                        ),
                                                      ),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Kota wajib di isi!';
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        BlocProvider<FormBloc>(
                                          create: (context) => FormBloc(
                                              RepositoryProvider.of<
                                                  FormRepository>(context))
                                            ..add(GetListPostalCode()),
                                          child:
                                              BlocBuilder<FormBloc, FormStates>(
                                            builder: (context, state) {
                                              if (state is PostalCodeListed) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10,
                                                          right: 20,
                                                          left: 20),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 190,
                                                        child: Text(
                                                          'Kode Pos*',
                                                          style:
                                                              textStylesFieldWeb,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 10,
                                                        margin: EdgeInsets.only(
                                                            left: 5),
                                                        child: Text(':'),
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          height: 50,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color:
                                                                    defaultColor),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                          child: DropdownSearch<
                                                              String>(
                                                            showSearchBox: true,
                                                            mode: Mode.MENU,
                                                            label: "",
                                                            dropDownButton:
                                                                Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          5.0),
                                                              child: Icon(
                                                                  Icons
                                                                      .arrow_drop_down,
                                                                  color: Color(
                                                                      0xFF08a396)),
                                                            ),
                                                            dropdownSearchDecoration:
                                                                InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets.only(
                                                                      bottom: 5,
                                                                      left: 10),
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  width: 0,
                                                                  style:
                                                                      BorderStyle
                                                                          .none,
                                                                ),
                                                              ),
                                                            ),
                                                            onFind: (String
                                                                filter) async {
                                                              var dataPosCode =
                                                                  state
                                                                      .datasPostalCode;
                                                              return dataPosCode;
                                                            },
                                                            itemAsString:
                                                                (String? u) => u!
                                                                    .toString(),
                                                            onChanged:
                                                                (String? data) {
                                                              setState(() {
                                                                postalCode = data!
                                                                    .toString();
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    right: 20,
                                                    left: 20),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 190,
                                                      child: Text(
                                                        'Kode Pos*',
                                                        style:
                                                            textStylesFieldWeb,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 10,
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(':'),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        height: 50,
                                                        margin: EdgeInsets.only(
                                                            left: 10),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                              color:
                                                                  defaultColor),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          textInputAction:
                                                              TextInputAction
                                                                  .next,
                                                          autofocus: false,
                                                          style:
                                                              textInputStylesField,
                                                          // controller: postalCodeCtrl,
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    top: 3,
                                                                    left: 10),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              borderSide:
                                                                  BorderSide(
                                                                width: 0,
                                                                style:
                                                                    BorderStyle
                                                                        .none,
                                                              ),
                                                            ),
                                                          ),
                                                          // validator: (value) {
                                                          //   if (value == null || value.isEmpty) {
                                                          //     return 'Kode pos wajib di isi!';
                                                          //   }
                                                          //   return null;
                                                          // },
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20, left: 20),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 190,
                                                child: Text(
                                                  'Alamat',
                                                  style: textStylesFieldWeb,
                                                ),
                                              ),
                                              Container(
                                                width: 10,
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(':'),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 50,
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: defaultColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.text,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    style: textInputStylesField,
                                                    minLines: 1,
                                                    maxLines: 3,
                                                    controller: addressCtrl,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              top: 3, left: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide: BorderSide(
                                                          width: 0,
                                                          style:
                                                              BorderStyle.none,
                                                        ),
                                                      ),
                                                    ),
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'Alamat wajib di isi!';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 20, left: 20),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 190,
                                                child: Text(
                                                  'No Whatsapp*',
                                                  style: textStylesFieldWeb,
                                                ),
                                              ),
                                              Container(
                                                width: 10,
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(':'),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 50,
                                                  margin:
                                                      EdgeInsets.only(left: 10),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: defaultColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    autofocus: false,
                                                    style: textInputStylesField,
                                                    controller: phoneNumbCtrl,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.only(
                                                              top: 3, left: 10),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        borderSide: BorderSide(
                                                          width: 0,
                                                          style:
                                                              BorderStyle.none,
                                                        ),
                                                      ),
                                                    ),
                                                    // validator: (value) {
                                                    //   if (value == null || value.isEmpty) {
                                                    //     return 'No handpone wajib di isi!';
                                                    //   }
                                                    //   return null;
                                                    // },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 20, left: 20, right: 20),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              '*Wajib diisi',
                                              textAlign: TextAlign.start,
                                              style: textStylesAlert,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 20, left: 10, right: 20),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Transform.scale(
                                                scale: 0.8,
                                                child: Checkbox(
                                                  value: valueAgreement,
                                                  side: MaterialStateBorderSide
                                                      .resolveWith(
                                                    (states) => BorderSide(
                                                        width: 2.0,
                                                        color: defaultColor),
                                                  ),
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      valueAgreement = value!;
                                                    });
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Saya menyetujui untuk menerima segala bentuk info dan promosi dari Pristine8.6+ dalam bentuk email, panggilan, maupun SMS',
                                                  style: textStylesFieldWeb,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              if (_formKey.currentState!
                                                      .validate() &&
                                                  valueAgreement == true &&
                                                  postalCode != "") {
                                                setState(() {
                                                  defaultColor =
                                                      Color(0xFF2ea49d);
                                                });
                                                BlocProvider.of<FormBloc>(
                                                        context)
                                                    .add(SubmitFormBtnPressed(
                                                        name: nameCtrl.text,
                                                        nik: ktpCtrl.text,
                                                        postalCode: postalCode,
                                                        address:
                                                            addressCtrl.text,
                                                        phone:
                                                            phoneNumbCtrl.text,
                                                        email: emailCtrl.text));
                                              } else {
                                                setState(() {
                                                  defaultColor =
                                                      Color(0xFFeb4034);
                                                });
                                              }
                                            },
                                            child: Container(
                                              height: 50.0,
                                              width: 115,
                                              margin: EdgeInsets.only(
                                                  top: 30.0, bottom: 20.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      'KIRIM',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF08a396),
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 5),
                                                    child: CircleAvatar(
                                                      radius: 20,
                                                      backgroundColor:
                                                          Color(0xFF08a396),
                                                      child: Icon(
                                                        Icons.arrow_forward_ios,
                                                        size: 14,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
  }
}
