import 'dart:ui';

import 'package:elearningfrontend/controllers/SignInController.dart';
import 'package:elearningfrontend/controllers/requests_controller.dart';
import 'package:elearningfrontend/screens/home.dart';
import 'package:elearningfrontend/util/pallet.dart';
import 'package:elearningfrontend/widgets/password_input.dart';
import 'package:elearningfrontend/widgets/rounded_button.dart';
import 'package:elearningfrontend/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'create_new_account copy.dart';


class Wrapper extends StatefulWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final SignInController signInController = Get.find();

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return signInController.jwt==null?CreateNewAccount():homePage();
        
        
  }
}
