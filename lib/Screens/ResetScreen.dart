import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pathshala1_0/Screens/Login/components/background.dart';

import 'logintry.dart';

class ResetScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    final emailField = TextFormField(
      autofocus: false,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => controller.text = value!,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Enter your Email",
        hintStyle: TextStyle(color: Colors.black),
        icon: Icon(
          Icons.person,
          color: Colors.amber.shade800,
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return ("Email is required for login");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
    );

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.orangeAccent,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      child: logintry(), type: PageTransitionType.leftToRight));
            },
          )
      ),
      backgroundColor: Colors.amber.shade200,
      body: Background(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Text(
          "Forgot Password",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.0
          ),
        ),

    SizedBox(
    height: size.height*0.03,
    ),
    Text(
    "Please Enter your Email to reset your password",
    style: TextStyle(
    color: Colors.black45,
    fontWeight: FontWeight.bold,
    fontSize: 18.0
    ),
    ),

    Container(
    alignment: Alignment.center,
    margin: EdgeInsets.all(15),
    padding:
    EdgeInsets.symmetric(horizontal:10, vertical: 5),
    width: size.width * 1,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(29),
    ),
    child: emailField)
    ],
    ),
    )
    );
  }

}