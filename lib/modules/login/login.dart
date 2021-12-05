import 'package:flutter/material.dart';
import 'package:lost_app/modules/login/forget_password.dart';
import 'package:lost_app/modules/register/register.dart';
import 'package:lost_app/shared/components/component.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  var loginPhoneControl = TextEditingController();

  var loginPasswordControl = TextEditingController();
  bool isVisible = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 30.0),
          child: SafeArea(
            child: Container(
              height: 700,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 400,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/login.png',
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 450,
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultText(
                                    text: 'رقم الهاتف',
                                    fontWeight: FontWeight.normal),
                                defaultTextFromField(
                                    textHint: 'ادخل رقم هاتفك',
                                    hintColor: Colors.black38,
                                    controller: loginPhoneControl,
                                    keyboardType:
                                        TextInputType.numberWithOptions(),
                                    validator: (value) {
                                      if (value!.isEmpty)
                                        return 'من فضلك ادخل رقم هاتفك';
                                      else if (value.length != 11)
                                        return 'رقم الهاتف غير صحيح';
                                      return null;
                                    }),
                                SizedBox(height: 10),
                                defaultText(
                                    text: 'كلمه المرور',
                                    fontWeight: FontWeight.normal),
                                defaultTextFromField(
                                  textHint: 'ادخل كلمه المرور',
                                  hintColor: Colors.black38,
                                  controller: loginPasswordControl,
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isVisible = !isVisible;
                                        });
                                      },
                                      icon: isVisible
                                          ? Icon(Icons.visibility)
                                          : Icon(Icons.visibility_off)),
                                  obscureText: isVisible,
                                  validator: (value) {
                                    if (value!.isEmpty)
                                      return 'من فضلك ادخل كلمه المرور';
                                    else if (value.length < 8)
                                      return 'كلمه المرور اقل من 8 احرف';
                                    else
                                      return null;
                                  },
                                ),
                                FlatButton(
                                    onPressed: () =>
                                        navigateTo(context, ForgetPassword()),
                                    child: defaultText(
                                      text: 'هل نسيت كلمه المرور ؟ ',
                                      textColor:
                                          Color.fromRGBO(42, 185, 237, 1),
                                    )),
                                SizedBox(height: 10),
                                ButtonTheme(
                                    minWidth: double.infinity,
                                    height: 50,
                                    child: defaultRaisedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!.validate())
                                            print('okey');
                                        },
                                        text: 'تسجيل الدخول',
                                        textColor: Colors.white)),
                                SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    defaultText(text: 'ليس لديك حساب ؟'),
                                    FlatButton(
                                        onPressed: () => navigatorAndFinish(
                                            context, RegisterScreen()),
                                        child: defaultText(
                                          text: 'إنشاء حساب',
                                          textColor:
                                              Color.fromRGBO(42, 185, 237, 1),
                                        )),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
