import 'package:flutter/material.dart';
import 'package:test_project/ui_elements/custom_text_field.dart';
import 'package:test_project/ui_elements/custom_button.dart';
import 'package:test_project/my_theme.dart';
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        child: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  isShowPrefixIcon: true,
                  prefixIconUrl: Icons.account_circle_outlined,
                  hintText: "Name",
                  fillColor: MyTheme.white,
                  // focusNode: FocusNode(),
                  inputType: TextInputType.text,
                  controller: TextEditingController(),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  isShowPrefixIcon: true,
                  prefixIconUrl: Icons.email_outlined,
                  hintText: "Email",
                  fillColor: MyTheme.white,
                  // focusNode: FocusNode(),
                  inputType: TextInputType.emailAddress,
                  controller: TextEditingController(),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  isShowPrefixIcon: true,
                  prefixIconUrl: Icons.lock_outline,
                  hintText: "Password",
                  fillColor: MyTheme.white,
                  // focusNode: FocusNode(),
                  inputType: TextInputType.visiblePassword,
                  controller: TextEditingController(),
                  // suffixIconUrl: Icons.visibility,
                  isPassword: true,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  isShowPrefixIcon: true,
                  prefixIconUrl: Icons.lock_outline,
                  hintText: "Confirm Password",
                  fillColor: MyTheme.white,
                  // focusNode: FocusNode(),
                  inputType: TextInputType.visiblePassword,
                  controller: TextEditingController(),
                  // suffixIconUrl: Icons.visibility,
                  isPassword: true,
                ),

                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  btnTxt: "Sign Up",
                  onTap: () {
                    print("tapped");
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: MyTheme.white,
                      shadowColor: MyTheme.light_grey,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "assets/images/fb.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    Card(
                      color: MyTheme.white,
                      shadowColor: MyTheme.light_grey,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        "assets/images/google2.png",
                        height: 50,
                        width: 50,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create New Account? ",   style: TextStyle(color: MyTheme.medium_grey,fontSize: 18,),),
                    InkWell(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.blue,fontSize: 18,),
                        ),
                        onTap: () {
                          print("tapped to login");
                        }
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
