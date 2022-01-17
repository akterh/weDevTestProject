import 'package:flutter/material.dart';
import 'package:test_project/custom/toast_component.dart';
import 'package:test_project/data_model/login_response.dart';
import 'package:test_project/my_theme.dart';
import 'package:test_project/repositories/auth_repository.dart';
import 'package:test_project/screens/home.dart';
import 'package:test_project/ui_elements/custom_button.dart';
import 'package:test_project/ui_elements/custom_text_field.dart';
import 'package:test_project/screens/registration.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  onPressedLoginBtn() async {
    var email = _emailController.text.toString();
    var password = _passwordController.text.toString();

    var loginResponse = await AuthRepository()
        .getLoginResponse(email, password);

    if(email.isEmpty){
      ToastComponent.showDialog("Enter Email", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    }else if(password.isEmpty){
      ToastComponent.showDialog("Enter Password", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    } else if(loginResponse.userEmail!=email){
      ToastComponent.showDialog("Authentication Error! Please check User name And Password", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);

    }else{
      ToastComponent.showDialog("Congratulation ${loginResponse.userNicename}!", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));


    }


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.light_grey,
      appBar: AppBar(
        backgroundColor: MyTheme.light_grey,
        elevation: 0.0,
        title: Text(""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  height: 50,
                  width: 170,
                  child: Image.asset(
                    'assets/images/dokan.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "Sign In",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
                children: [
                  CustomTextField(
                    isShowPrefixIcon: true,
                    prefixIconUrl: Icons.email_outlined,
                    hintText: "Email",
                    fillColor: MyTheme.white,
                    // focusNode: FocusNode(),
                    inputType: TextInputType.emailAddress,
                    controller: _emailController,

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    isShowPrefixIcon: true,
                    prefixIconUrl: Icons.lock_outline,
                    hintText: "Password",
                    fillColor: MyTheme.white,
                    // focusNode: FocusNode(),
                    inputType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    isShowSuffixIcon: true,
                    // suffixIconUrl: Icons.visibility,
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: MyTheme.medium_grey),
                          ),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomButton(
                    btnTxt: "Login",
                    onTap: () {
                      onPressedLoginBtn();

                    },
                  ),
                  SizedBox(
                    height: 40,
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
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: InkWell(
                      child: Text(
                        "Create New Account",
                        style: TextStyle(color: MyTheme.medium_grey,fontSize: 18,),
                      ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register()));
                        }

                    ),
                  )
                ],
              ),
            
          ],
        ),
      ),
    );
  }
}
