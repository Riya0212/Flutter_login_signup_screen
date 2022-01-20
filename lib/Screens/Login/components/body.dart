import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pathshala1_0/Screens/Login/components/background.dart';
import 'package:pathshala1_0/components/rounded_input_field.dart';
import 'package:pathshala1_0/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/pathshala.png',
                height: size.height * 0.15,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                'LOGIN',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20.0),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedInputField(
                  hintText: "Enter your Email", onChanged: (value) {}),
              RoundedPasswordField(onChanged: (value) {}),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: size.width * 0.9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    color: Colors.amber.shade600,
                    onPressed: () => {},
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an Account ?",
                      style: TextStyle(color: Colors.deepOrange.shade300),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.orangeAccent.shade700,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
              // SizedBox(
              //   height: size.height * 0.03,
              // ),
              //
              //     Flexible(
              //       child: Row(
              //         children: [
              //           SignInButton(
              //             Buttons.Google,
              //             text: "Sign up with Google",
              //             onPressed: () {},
              //           )
              //         ],
              //       ),
              //     )
            ],
          ),
        ),
      ),
    );
  }
}
