import 'package:elearningfrontend/controllers/SignInController.dart';
import 'package:elearningfrontend/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
    final SignInController signInController=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("profile"),
    
    ),
    body: Text(signInController.jwt),floatingActionButton: FloatingActionButton(onPressed: (){signInController.logout(); 
    Get.to(Wrapper());},), );
  }
}