import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:hexcolor/hexcolor.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String pincode = '0';
  String _email = 'dummy@gmail.com';

  bool verifyOtp(String emailId, String _pincode) {
    // EmailAuth email = EmailAuth(sessionName: 'LoginSession');
    // final res = email.validateOtp(recipientMail: emailId, userOtp: _pincode);
    // return res;
  }

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context).settings.arguments as String;
    double getProportionateScreenHeight(double inputHeight) {
      double screenHeight = MediaQuery.of(context).size.height;
      return (inputHeight / 812.0) * screenHeight;
    }

    double getProportionateScreenWidth(double inputWidth) {
      double screenWidth = MediaQuery.of(context).size.width;
      return (inputWidth / 375.0) * screenWidth;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Check Your Email',
              style: TextStyle(
                  color: HexColor('#3E5481'),
                  fontSize: 23,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: getProportionateScreenHeight(7),
            ),
            Text("We've sent the code on your email",
                style: TextStyle(fontSize: 17, color: HexColor('#9FA5C0'))),
            SizedBox(
              height: getProportionateScreenHeight(12),
            ),
            PinCodeFields(
              length: 6,
              fieldBorderStyle: FieldBorderStyle.Square,
              responsive: false,
              fieldHeight: 60.0,
              fieldWidth: 60.0,
              borderWidth: 1.5,
              borderRadius: BorderRadius.circular(15),
              activeBorderColor: HexColor('#2B5292'),
              borderColor: HexColor('#9FA5C0'),
              textStyle: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              onComplete: (output) {
                // Your logic with pin code
                pincode = output;
              },
            ),
            SizedBox(
              height: getProportionateScreenHeight(22),
            ),
            ButtonTheme(
              minWidth: getProportionateScreenWidth(275),
              height: getProportionateScreenHeight(50),
              // ignore: deprecated_member_use
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22)),
                onPressed: () {
                  final checkPasses = verifyOtp(email, pincode);
                  if (checkPasses == true) {
                    Navigator.of(context).pushReplacementNamed('mainUi');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Invalid Otp',
                      ),
                      duration: Duration(milliseconds: 500),
                    ));
                    Navigator.of(context).pop();
                  }
                },
                color: HexColor('#2B5292'),
                padding: EdgeInsets.all(10),
                child: Text(
                  'Verify',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(12),
            ),
            ButtonTheme(
              minWidth: getProportionateScreenWidth(275),
              height: getProportionateScreenHeight(50),
              // ignore: deprecated_member_use
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: HexColor('#D0DBEA'), width: 2),
                    borderRadius: BorderRadius.circular(22)),
                onPressed: () {},
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Text(
                  'Send Again',
                  style: TextStyle(fontSize: 20, color: HexColor('#2B5292')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
