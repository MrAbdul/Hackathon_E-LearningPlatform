import 'dart:ui';

import 'package:elearningfrontend/controllers/requests_controller.dart';
import 'package:elearningfrontend/screens/create_new_account.dart';
import 'package:elearningfrontend/util/pallet.dart';
import 'package:elearningfrontend/widgets/password_input.dart';
import 'package:elearningfrontend/widgets/rounded_button.dart';
import 'package:elearningfrontend/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class CreateNewAccount extends StatefulWidget {
  CreateNewAccount({Key? key}) : super(key: key);

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  final RequestsController requestsController = Get.find();

  final emailTextController = TextEditingController();

  final passwordTextController = TextEditingController();

  final password2TextController = TextEditingController();

  _signUp() {
    requestsController.signUp(
      
        emailTextController.text, password2TextController.text);
  }

  var isTeacher=false;

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
                        hint: 'Email',
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
                      PasswordInput(
                        controller: password2TextController,
                        key: widget.key,
                        icon: FontAwesomeIcons.lock,
                        hint: 'Confirm Password',
                        inputAction: TextInputAction.done,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      RoundedButton(
                        buttonName: 'Register',
                        onPress: _signUp,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: kBodyText,
                          ),
                          GestureDetector(
                            onTap: () {Get.to(SignIn());},
                            child: Text(
                              'Login',
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
