import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pathshala1_0/HomePage.dart';
import 'package:pathshala1_0/Screens/logintry.dart';
import 'package:pathshala1_0/model/user_model.dart';

class signup extends StatefulWidget {
  _signup createState() => _signup();
}

class _signup extends State<signup> {

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final usernameEditingController = new TextEditingController();
  final firstnameEditingController = new TextEditingController();
  final lastnameEditingController = new TextEditingController();
  final contactEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    final usernameField = TextFormField(
      autofocus: false,
      controller: usernameEditingController,
      keyboardType: TextInputType.text,
      onSaved: (value) => usernameEditingController.text = value!,
      textInputAction: TextInputAction.next,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("User Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Enter your Username",
        hintStyle: TextStyle(color: Colors.black),
        icon: Icon(
          Icons.account_circle,
          color: Colors.amber.shade800,
        ),
      ),
    );
    final firstnameField = TextFormField(
      autofocus: false,
      controller: firstnameEditingController,
      keyboardType: TextInputType.text,
      onSaved: (value) => firstnameEditingController.text = value!,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        return null;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Enter your Firstname",
        hintStyle: TextStyle(color: Colors.black),
        icon: Icon(
          Icons.account_circle,
          color: Colors.amber.shade800,
        ),
      ),
    );
    final lastnameField = TextFormField(
      autofocus: false,
      controller: lastnameEditingController,
      keyboardType: TextInputType.text,
      onSaved: (value) => lastnameEditingController.text = value!,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Last Name cannot be Empty");
        }
        return null;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Enter your Lastname",
        hintStyle: TextStyle(color: Colors.black),
        icon: Icon(
          Icons.account_circle,
          color: Colors.amber.shade800,
        ),
      ),
    );
    final contactField = TextFormField(
      autofocus: false,
      controller: contactEditingController,
      keyboardType: TextInputType.phone,
      onSaved: (value) => contactEditingController.text = value!,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Contact cannot be Empty");
        }
        return null;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Enter your Contact",
        hintStyle: TextStyle(color: Colors.black),
        icon: Icon(
          Icons.phone,
          color: Colors.amber.shade800,
        ),
      ),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => emailEditingController.text = value!,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Enter your Email",
        hintStyle: TextStyle(color: Colors.black),
        icon: Icon(
          Icons.email,
          color: Colors.amber.shade800,
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      onSaved: (value) => passwordEditingController.text = value!,
      textInputAction: TextInputAction.next,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "Enter your Password",
        hintStyle: TextStyle(color: Colors.black),
        icon: Icon(
          Icons.vpn_key,
          color: Colors.amber.shade800,
        ),
      ),
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
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  // Image.asset(
                  //   'images/pathshala.png',
                  //   fit: BoxFit.contain,
                  //   height: size.height * 0.15,
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.03,
                  // ),
                  Text(
                    'Register on Pathshala',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 25.0),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  //username field
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade200,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: usernameField),
                  //firstname
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade200,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: firstnameField),
                  //lastname
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade200,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: lastnameField),
                  //contact
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade200,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: contactField),
                  //email field
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade200,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: emailField),
                  //password field
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade200,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: passwordField),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    width: size.width * 0.9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40),
                        color: Colors.amber.shade600,
                        onPressed: () {
                         signUp(emailEditingController.text,passwordEditingController.text);
                        },
                        child: Text(
                          "SignUp",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password).then((value) =>
      {
        postDetailsToFirestore()
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //call firestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = usernameEditingController.text;
    userModel.firstname = firstnameEditingController.text;
    userModel.lastname = lastnameEditingController.text;
    userModel.contact = contactEditingController.text;

    await firebaseFirestore.collection("users").doc(user.uid).set(
        userModel.toMap());
    Fluttertoast.showToast(msg: 'Account Created Successfully');

    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);


    //call usermodel
    //send the values


  }
}
