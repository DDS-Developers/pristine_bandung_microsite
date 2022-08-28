import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CustomAlertDialog extends StatelessWidget {
  final AlertType alertType;
  final String title;
  final String subtitle;
  final String mainButtonText;
  final VoidCallback mainButtonOnTap;
  final bool secondButton;
  final ButtonType secondButtonType;
  final String secondButtonText;
  final VoidCallback? secondButtonOnTap;

  CustomAlertDialog({
    required this.alertType,
    required this.title,
    required this.subtitle,
    required this.mainButtonText,
    required this.mainButtonOnTap,
    this.secondButton = false,
    this.secondButtonType = ButtonType.neutral,
    this.secondButtonText = '',
    this.secondButtonOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              alertType != AlertType.none
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                        child: Center(
                          child: FaIcon(
                            _getAlertIcon(),
                            size: 50.0,
                            color: _getAlertColor(),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                    ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(24.0, 15.0, 24.0, 10.0),
                      child: Text(
                        title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24.0,
                          color: _getAlertColor(),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 24.0),
                      child: Text(
                        subtitle,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 14.0),
            child: Row(
              children: <Widget>[
                secondButton
                    ? Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.0),
                          child: DialogButton(
                            color: _getButtonColor(),
                            radius: BorderRadius.circular(18.0),
                            child: Text(
                              secondButtonText,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: secondButtonOnTap,
                          ),
                        ),
                      )
                    : Container(),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: DialogButton(
                      radius: BorderRadius.circular(18.0),
                      color: Color(0xFF2ea49d),
                      child: Text(
                        mainButtonText,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: mainButtonOnTap,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Color _getAlertColor() {
    Color response = Color(0xFF81C153);
    switch (alertType) {
      case AlertType.success:
        response = Color(0xFF81C153);
        break;
      case AlertType.warning:
        response = Color(0xFFFFD13B);
        break;
      case AlertType.error:
        response = Color(0xFFFF0000);
        break;
      case AlertType.info:
        response = Color(0xFF427CEF);
        break;
      case AlertType.none:
        break;
    }
    return response;
  }

  IconData _getAlertIcon() {
    IconData response = FontAwesomeIcons.solidCheckCircle;
    switch (alertType) {
      case AlertType.success:
        response = FontAwesomeIcons.solidCheckCircle;
        break;
      case AlertType.warning:
        response = FontAwesomeIcons.exclamationTriangle;
        break;
      case AlertType.error:
        response = FontAwesomeIcons.timesCircle;
        break;
      case AlertType.info:
        response = FontAwesomeIcons.infoCircle;
        break;
      case AlertType.none:
        break;
    }
    return response;
  }

  Color _getButtonColor() {
    Color response;
    switch (secondButtonType) {
      case ButtonType.positive:
        response = Color(0xFF44BBA4);
        break;
      case ButtonType.negative:
        response = Colors.red;
        break;
      case ButtonType.neutral:
        response = Color(0xFF2ea49d);
        break;
    }
    return response;
  }
}

enum AlertType { success, warning, error, info, none }

enum ButtonType { positive, negative, neutral }
