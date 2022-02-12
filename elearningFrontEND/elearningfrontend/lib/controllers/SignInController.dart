import 'package:elearningfrontend/dto/User.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SignInController extends GetxController{

var jwt;
User? user;
  void setJwt(String jwtToken) {
    jwt=jwtToken;
    update();
  }
  void logout(){
    jwt=null;
    update;
  }

  
}