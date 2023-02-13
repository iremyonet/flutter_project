import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  final double imgHeight;
  HeroImage({required this.imgHeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/login_bg.png'),
      width: MediaQuery.of(context).size.width,
      height: imgHeight,
    );
  }
}

class CustomButton extends StatelessWidget {
  final String btnText;
  final Function  onBtnPressed;
  CustomButton({ required this.btnText, required this.onBtnPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){},
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnText!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
