import 'package:get/get_state_manager/get_state_manager.dart';

class SignInController extends GetxController{

var jwt;
  void setJwt(String jwt) {
    jwt=jwt;
    update();
  }
  void logout(){
    jwt=null;
  }

  
}