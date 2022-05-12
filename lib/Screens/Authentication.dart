import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _name = new TextEditingController();

  final _forms = GlobalKey<FormState>();

  var login = false;

  Future<bool> sendOtp(String emailId) async {
    // EmailAuth email = EmailAuth(sessionName: 'LoginSession');
    // final res = await email.sendOtp(recipientMail: emailId, otpLength: 6);
    // return res;
  }

  void saveForm() async {
    var isValid = _forms.currentState.validate();
    FocusScope.of(context).unfocus();
    if (!isValid) {
      return;
    }
    // final check = await sendOtp(_email.text);
    // if (check == true) {
    //   Navigator.of(context).pushNamed('otpScreen', arguments: _email.text);
    // } else if (check == false) {
    //   AlertDialog(
    //     content: Icon(Icons.error),
    //     actions: [
    //       FlatButton(
    //           onPressed: () {
    //             Navigator.of(context).pop();
    //           },
    //           child: Text('Try Later'))
    //     ],
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    double getProportionateScreenHeight(double inputHeight) {
      double screenHeight = MediaQuery.of(context).size.height;
      return (inputHeight / 812.0) * screenHeight;
    }

    double getProportionateScreenWidth(double inputWidth) {
      double screenWidth = MediaQuery.of(context).size.width;
      return (inputWidth / 375.0) * screenWidth;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _forms,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(220),
                  child: AspectRatio(
                    aspectRatio: 4.5,
                    child: Container(
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                ),
                Text(
                  login ? 'Welcome Back!' : 'Welcome!',
                  style: TextStyle(
                      color: HexColor('#3E5481'),
                      fontSize: 23,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Please Enter Your Account Details Here',
                  style: TextStyle(fontSize: 15, color: HexColor('#9FA5C0')),
                ),
                SizedBox(
                  height: 24,
                ),
                if (login == false)
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      key: ValueKey('name'),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor('#3E5481'), width: 1.5)),
                          hintText: 'Enter Your Name',
                          contentPadding: EdgeInsets.all(15),
                          prefixIcon: Icon(Icons.person,
                              size: 19, color: HexColor('#3E5481')),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                  width: 1, color: HexColor('#3E5481')))),
                      controller: _name,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please Enter Your Name';
                        }

                        return null;
                      },
                    ),
                  ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    key: ValueKey('email'),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: HexColor(
                                  '#2B5292',
                                ),
                                width: 1.5)),
                        hintText: 'Please Enter Your Email',
                        contentPadding: EdgeInsets.all(15),
                        prefixIcon: Icon(Icons.email,
                            size: 19, color: HexColor('#3E5481')),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                width: 1, color: HexColor('#3E5481')))),
                    obscureText: false,
                    controller: _email,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'email cannot be empty';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: HexColor(
                                  '#2B5292',
                                ),
                                width: 1.5)),
                        hintText: 'Enter Password',
                        contentPadding: EdgeInsets.all(15),
                        prefixIcon: Icon(Icons.lock,
                            size: 19, color: HexColor('#3E5481')),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                width: 1, color: HexColor('#3E5481')))),
                    controller: _password,
                    obscureText: true,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please Enter A Price';
                      }
                      if (val.length < 6) {
                        return 'Please Enter a Password with 6 characters or greater';
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(height: 24),
                if (login != true)
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Password Must Contain',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 10),
                        Row(children: [
                          Icon(Icons.check_circle_outlined,
                              color: Colors.green, size: 16),
                          SizedBox(width: 10),
                          Text('At least 6 characters',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15))
                        ]),
                        SizedBox(height: 7),
                        Row(children: [
                          Icon(Icons.check_circle_outlined,
                              color: Colors.green, size: 16),
                          SizedBox(width: 10),
                          Text('Contains a number',
                              style: TextStyle(
                                  color: HexColor('#9FA5C0'), fontSize: 15))
                        ])
                      ],
                    ),
                  ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        login ? 'Sign In' : 'Sign Up',
                        style: TextStyle(
                            fontSize: 23,
                            color: HexColor('#3E5481'),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: FloatingActionButton(
                        onPressed: () {
                          saveForm();
                        },
                        backgroundColor: HexColor('#3E5481'),
                        child: Icon(Icons.arrow_right_alt, color: Colors.white),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            login = !login;
                          });
                        },
                        child: Text(
                          !login ? 'Log In' : 'Sign Up',
                          style: TextStyle(
                              fontSize: 17,
                              color: HexColor('#3E5481'),
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    Spacer(),
                    if (login)
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontSize: 17,
                                color: HexColor('#3E5481'),
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// ButtonTheme(
//                   minWidth: getProportionateScreenWidth(275),
//                   height: getProportionateScreenHeight(45),
//                   // ignore: deprecated_member_use
//                   child: RaisedButton(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(22)),
//                     onPressed: () {
//                       saveForm();
//                     },
//                     color: HexColor('#2B5292'),
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                       login ? 'Log In' : 'Sign Up',
//                       style: TextStyle(fontSize: 17, color: Colors.white),
//                     ),
//                   ),
//                 ),


// ButtonTheme(
//                   minWidth: getProportionateScreenWidth(275),
//                   height: getProportionateScreenHeight(45),
//                   // ignore: deprecated_member_use
//                   child: RaisedButton(
//                     elevation: 0,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(22)),
//                     onPressed: () {
//                       setState(() {
//                         login = !login;
//                       });
//                     },
//                     color: Colors.white,
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                       !login ? 'Log In' : 'Sign Up',
//                       style: TextStyle(
//                           fontSize: 17,
//                           color: HexColor('#2B5292'),
//                           decoration: TextDecoration.underline),
//                     ),
//                   ),
//                 )