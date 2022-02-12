import 'dart:ui';

import 'package:elearningfrontend/controllers/SignInController.dart';
import 'package:elearningfrontend/controllers/requests_controller.dart';
import 'package:elearningfrontend/dto/User.dart';
import 'package:elearningfrontend/screens/wrapper.dart';
import 'package:elearningfrontend/util/pallet.dart';
import 'package:elearningfrontend/widgets/password_input.dart';
import 'package:elearningfrontend/widgets/rounded_button.dart';
import 'package:elearningfrontend/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'create_new_account copy.dart';


class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final RequestsController requestsController = Get.find();
    final SignInController signInController=Get.find();


  final emailTextController = TextEditingController();

  final passwordTextController = TextEditingController();

  final password2TextController = TextEditingController();

  var isTeacher=false;
  _login() async{
    if (!isTeacher){
    User user =await requestsController.signIn(
      
        emailTextController.text, passwordTextController.text);
        signInController.setJwt(user.accessToken!);
        signInController.setUser(user);
            Get.to(Wrapper());
    }else{
      User user =await requestsController.teacherSignIn(
      
        emailTextController.text, passwordTextController.text);
        signInController.setJwt(user.accessToken!);
        signInController.setUser(user);
            Get.to(Wrapper());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                          height: 100,
                          child: Center(
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Teacher"),Switch(value: isTeacher, onChanged: (k){setState(() {
                              isTeacher=k;
                            });;}),Text("Student")],)
                          )),
                      TextInputField(
                        controller: emailTextController,
                        key: widget.key,
                        icon: FontAwesomeIcons.envelope,
                        hint: 'Username',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      PasswordInput(
                        controller: passwordTextController,
                        key: widget.key,
                        icon: FontAwesomeIcons.lock,
                        hint: 'Password',
                        inputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      RoundedButton(
                        buttonName: 'Login',
                        onPress: _login,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont have an account',
                            style: kBodyText,
                          ),
                          GestureDetector(
                            onTap: () {Get.to(CreateNewAccount());},
                            child: Text(
                              'Register',
                              style: kBodyText.copyWith(
                                  color: kBlue, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
  }
}
