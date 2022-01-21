import 'package:flutter/material.dart';
import '../../components.dart';
import 'components/Create_an_Account.dart';
import '../homeScreen/homeScreen.dart';
import '../listScreen/listScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var passwordController = TextEditingController();
  var emailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    color: Color.fromRGBO(213, 160, 33, 1),
                    height: size.height * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Hero(
                          tag: 'logo',
                          child: Container(
                            child: Image.asset('assets/logo.png'),
                            height: size.height * 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CreateAnAccount(),
                ],
              ),
              Positioned(
                bottom: size.height * 0.2,
                left: size.width * 0.05,
                right: size.width * 0.05,
                top: size.height * 0.35,
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 2, end: 1),
                  duration: Duration(seconds: 1),
                  builder: (context, scale, child) {
                    return Transform.scale(scale: scale, child: child);
                  },
                  child: Material(
                    shadowColor: Colors.black,
                    elevation: 8,
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Login',
                            style: TextStyle(
                                color: kPrimaryColorTwo, fontSize: 30),
                          ),
                          SizedBox(height: size.height * 0.08),
                          TextFormField(
                            cursorColor: kPrimaryColorTwo,
                            decoration: kTextFormFieldDecoration.copyWith(
                                labelText: "Email"),
                            controller: emailControler,
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            obscureText: true,
                            cursorColor: kPrimaryColorTwo,
                            decoration: kTextFormFieldDecoration.copyWith(
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: kPrimaryColorTwo,
                              ),
                            ),
                            controller: passwordController,
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: kPrimaryColorTwo,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.77,
                left: size.width * 0.39,
                child: ElevatedButton(
                    onPressed: () {
                      if (emailControler.text == "uftunca72@gmail.com" &&
                          passwordController.text == "123456") {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                          builder: (context) {
                            return ListScreen(emailControler.text);
                          },
                        ), (route) => false);
                      }
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(primary: kPrimaryColorTwo)),
              ),
            ],
          ),
        ),
      ),
      onWillPop: onBackPressed,
    );
  }

  Future<bool> onBackPressed() {
    return Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return HomeScreen();
      },
    ), (route) => false);
  }
}
