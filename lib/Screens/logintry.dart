import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pathshala1_0/HomePage.dart';
import 'package:pathshala1_0/Screens/Login/components/background.dart';
import 'package:pathshala1_0/Screens/ResetScreen.dart';
import 'package:pathshala1_0/Screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class logintry extends StatefulWidget {
  _logintry createState() => _logintry();
}

class _logintry extends State<logintry> {
  bool checkValue = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  late SharedPreferences sharedPreferences;

  void initState() {
    _loadUserEmailPassword();
    super.initState();

  }

  // login() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //
  //     try {
  //       await _auth.signInWithEmailAndPassword(
  //           email: _email, password: _password);
  //     } catch (e) {
  //      showError(e.errormessage);
  //       print(e);
  //     }
  //   }
  // }

  // showError(String errormessage) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text('ERROR'),
  //           content: Text(errormessage),
  //           actions: <Widget>[
  //             FlatButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text('OK'))
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) => emailController.text = value!,
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

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      onSaved: (value) => passwordController.text = value!,
      textInputAction: TextInputAction.done,
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
          Icons.lock,
          color: Colors.amber.shade800,
        ),
        suffixIcon: Icon(
          Icons.visibility,
          color: Colors.amber.shade800,
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Background(
        child: Container(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/pathshala.png',
                        fit: BoxFit.contain,
                        height: size.height * 0.15,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        'Welcome to Pathshala',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      //email field
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.amber.shade200,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: emailField),
                      //Password field
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: size.width * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.amber.shade200,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: passwordField),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          child: Row(
                            children: [
                                    SizedBox(
                                        height: 10.0,
                                        width: 24.0,
                                        child: Theme(
                                          data: ThemeData(
                                              unselectedWidgetColor: Color(0xff00C8E8) // Your color
                                          ),
                                          child: Checkbox(
                                              activeColor: Colors.deepOrange,
                                              value: checkValue,
                                              onChanged: _onChanged),
                                        )),
                                    SizedBox(width: size.width*0.01,),
                                    Text("Remember Me",
                                        style: TextStyle(
                                            color: Colors.deepOrange.shade300,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold)),
                              SizedBox(width: size.width*0.2,),

                          TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, PageTransition(
                                      child: ResetScreen(), type: PageTransitionType.rightToLeft));
                                },
                                child: Text('Forgot Password?', style: TextStyle(
                                    color: Colors.deepOrange.shade300,
                                    fontSize: 16.0, fontWeight: FontWeight.bold
                                ),
                                ),
                            ),

                        ]
                        ),
                        ),
                          ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        width: size.width * 0.9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 40),
                            color: Colors.amber.shade600,
                            onPressed: () {
                              signIn(emailController.text,
                                  passwordController.text);
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an Account ?",
                              style:
                              TextStyle(color: Colors.deepOrange.shade300),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        child: signup(),
                                        type: PageTransitionType.rightToLeft));
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.orangeAccent.shade700,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),

      //Image.asset('images/Vector.png'),
    );
  }
  _onChanged(bool? value) async {

    checkValue= value!;
    SharedPreferences.getInstance().then(
          (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', emailController.text);
        prefs.setString('password', passwordController.text);
      },
    );
    setState(() {
      checkValue = value;
    });

    // setState(() {
    //   checkValue = value!;
    //   sharedPreferences.setBool("check", checkValue);
    //   sharedPreferences.setString("email", emailController.text.toString());
    //   sharedPreferences.setString("password", passwordController.text.toString());
    //   sharedPreferences.commit();
    //   getCredential();
    // });
  }
  void _loadUserEmailPassword() async {
    print("Load Email");
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _rememberMe = _prefs.getBool("remember_me") ?? false;

      print(_rememberMe);
      print(_email);
      print(_password);
      if (_rememberMe) {
        setState(() {
          checkValue = true;
        });
        emailController.text = _email ?? "";
        passwordController.text = _password ?? "";
      }
    } catch (e) {
      print(e);
    }
  }

  getCredential() async {
    sharedPreferences = await SharedPreferences.getInstance();

    // setState(() {
    //   checkValue = sharedPreferences.getBool("check")!;
    //   if (checkValue != null) {
    //     if (checkValue) {
    //       emailController.text = sharedPreferences.getString("email")!;
    //       passwordController.text = sharedPreferences.getString("password")!;
    //     } else {
    //       emailController.clear();
    //       passwordController.clear();
    //       sharedPreferences.clear();
    //     }
    //   } else {
    //     checkValue = false;
    //   }
    // });
  }

  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) =>
      {
        Fluttertoast.showToast(msg: "Login Successful"),
        Navigator.pushReplacement(context, PageTransition(
            child:HomePage(),
        type: PageTransitionType.rightToLeft))
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logout"),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => logintry()),
                        (route) => false);
              },
              child: Icon(Icons.logout))
        ],
      ),
    );
  }
}
