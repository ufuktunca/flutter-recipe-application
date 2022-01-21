import 'package:flutter/material.dart';
import '../../registerScreen/registerScreen.dart';
import '../../../components.dart';

class CreateAnAccount extends StatelessWidget {
  const CreateAnAccount();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Don’t have an Account?',
          style: TextStyle(color: kPrimaryColorTwo),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return RegisterScreen();
              },
            ), (route) => false);
          },
          child: Text(
            'Register',
            style: TextStyle(
              color: kPrimaryColorTwo,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
