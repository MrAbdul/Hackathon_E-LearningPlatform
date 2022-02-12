import 'package:elearningfrontend/util/pallet.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback? onPress;
  

  const RoundedButton({
    Key? key,
    @required this.buttonName,
    @required this.onPress,
  }) : super(key: key);

  final String? buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: TextButton(
        onPressed: onPress??()=>{},
        child: Text(
          buttonName??"name",
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}