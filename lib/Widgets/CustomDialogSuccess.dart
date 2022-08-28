import 'package:flutter/material.dart';

class CustomDialogSucces extends StatelessWidget {
  final BuildContext contextBloc;
  final String voucherCode;
  final String name;
  CustomDialogSucces(
      {required this.contextBloc,
      required this.voucherCode,
      required this.name});

  @override
  Widget build(BuildContext context) {
    // //print("INI REDIRET URL: $redirectURL");
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.5,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFe3f9f0), borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(left: 0.0, right: 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      'UNIQUE CODE: ',
                      style: TextStyle(color: Color(0xFF2ea49d), fontSize: 10),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 2, bottom: 2),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF2ea49d)),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        voucherCode,
                        style: TextStyle(
                            color: Color(0xFF2ea49d),
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/logo_pristine.jpg',
                      height: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/Pristime_logo.png',
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: Text(
                "Congratulations",
                style: TextStyle(
                    color: Color(0xFF2ea49d),
                    fontSize: 13,
                    fontWeight: FontWeight.w200),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                    color: Color(0xFF2ea49d),
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Divider(
              color: Color(0xFF08a396),
              thickness: 2,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 40, right: 40, bottom: 20),
            child: Center(
              child: Text(
                "Kamu dapat 1 invitation ke Pristime It's Pristine8.6+ Time!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF2ea49d),
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Image.asset(
            'assets/popup_succes_tgl.png',
            scale: 0.75,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 28, right: 28, bottom: 10),
            child: Center(
              child: Text(
                "Yuk tukarkan free merchandise kamu dan temukan semua keseruan :",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF2ea49d),
                    fontSize: 13,
                    fontWeight: FontWeight.w200),
              ),
            ),
          ),
          Image.asset(
            'assets/popup_succes_footer.png',
            scale: 0.75,
          ),
        ],
      ),
    );
  }
}
