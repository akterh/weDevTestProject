import 'package:flutter/material.dart';
import 'package:test_project/custom/toast_component.dart';
import 'package:test_project/my_theme.dart';
import 'package:test_project/repositories/auth_repository.dart';
import 'package:test_project/ui_elements/custom_text_field.dart';
import 'package:test_project/ui_elements/custom_button.dart';
import 'package:toast/toast.dart';
import 'package:test_project/screens/home.dart';

import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);
  

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _nameController= TextEditingController();
  TextEditingController _emailController= TextEditingController();
  TextEditingController _passController= TextEditingController();
  TextEditingController _confirmPassController= TextEditingController();
  onPressedSignUpBtn()async{
    String name = _nameController.text.toString();
    String email = _emailController.text.toString();
    String password = _passController.text.toString();
    String confirmPass = _confirmPassController.text.toString();
    var signUpResponse = await AuthRepository().getSignupResponse(name, email, password);
    if(name.isEmpty){
      ToastComponent.showDialog("Enter User Name", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    }else if(email.isEmpty){
      ToastComponent.showDialog("Enter Email", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    }else if(password.isEmpty && password.length<6  ){
      ToastComponent.showDialog("Enter 6 digit Password", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    }else if(password!=confirmPass){
      ToastComponent.showDialog("Password Mismatch", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    }else if(signUpResponse.code!=200){
      ToastComponent.showDialog("${signUpResponse.message}", context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);

    }else{
      if(signUpResponse.code==200){
        ToastComponent.showDialog("${signUpResponse.message}", context,
            gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
      }
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
    }
    
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.light_grey,
        appBar: AppBar(
          backgroundColor: MyTheme.light_grey,
          elevation: 0,
          title: Text(
            "Register",
            style: TextStyle(color: Colors.black),
          ),
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
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MyTheme.white,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          child: Padding(
                            padding: EdgeInsets.all(40),
                            child: InkWell(
                              onTap: () {
                                print("tapped");
                              },
                              child: Image.asset(
                                "assets/images/profile.png",
                                color: MyTheme.medium_grey,
                                height: 40,
                                width: 40,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: 70,
                          height: 65,
                          width: 65,
                          child: Image.asset(
                            "assets/images/camera.png",
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),

              SizedBox(
                height: 50,
              ),
             Column(
                  children: [
                    CustomTextField(
                      isShowPrefixIcon: true,
                      prefixIconUrl: Icons.account_circle_outlined,
                      hintText: "Name",
                      fillColor: MyTheme.white,
                      // focusNode: FocusNode(),
                      inputType: TextInputType.text,
                      controller: _nameController,
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
                      controller: _emailController,
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
                      controller: _passController,
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
                      controller: _confirmPassController,
                      // suffixIconUrl: Icons.visibility,
                      isPassword: true,
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    CustomButton(
                      btnTxt: "Sign Up",
                      onTap: () {
                       onPressedSignUpBtn();
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Create New Account? ",   style: TextStyle(color: MyTheme.medium_grey,fontSize: 18,),),
                          InkWell(
                              child: Text(
                                "Login",
                                style: TextStyle(color: Colors.blue,fontSize: 18,),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));

                              }
                          ),
                        ],
                      ),
                    )
                  ],
                ),
            ],
          ),
        )
    );
  }
}
