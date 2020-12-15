import 'package:diveapp/composition_root.dart';
import 'package:diveapp/pages/home_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:diveapp/states_management/auth/auth_cubit.dart';
import 'package:diveapp/states_management/auth/auth_state.dart';
import 'package:diveapp/widgets/custom_flat_button.dart';
import 'package:diveapp/widgets/custom_outline_button.dart';
import 'package:diveapp/widgets/custom_text_field.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  AuthPage();
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  PageController _controller = PageController();

  String _username = '';
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 110.0),
              child: _buildLogo(),
            ),
            SizedBox(height: 50.0),
            _buildUI(),
          ],
        ),
      ),
    );
  }

  _buildLogo() => Container(
        alignment: Alignment.center,
        child: Column(children: [
          SizedBox(height: 10.0),
          RichText(
            text: TextSpan(
                text: 'Dive',
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.black,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                children: [
                  TextSpan(
                    text: ' Tracker',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  )
                ]),
          )
        ]),
      );

  _buildUI() => Expanded(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            _signIn(),
            _signUp(),
          ],
        ),
      );

  _signIn() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            ..._emailAndPassword(),
            SizedBox(height: 30.0),
            CustomFlatButton(
              text: 'Sign in',
              size: Size(double.infinity, 54.0),
              onPressed: () {
                _showLoader();
                if (validateUser(_email, _password)) {
                  login(_email, _password);
                }
              },
            ),
            SizedBox(height: 30.0),
            CustomOutlineButton(
              text: 'Sign in with google',
              size: Size(double.infinity, 50.0),
              icon: new Image.asset(
                'assets/google-icon.png',
                height: 18.0,
                width: 18.0,
                fit: BoxFit.fill,
              ),
              onPressed: () {},
            ),
            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account?',
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    ),
                children: [
                  TextSpan(
                    text: ' Sign up',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.elasticOut);
                      },
                  )
                ],
              ),
            )
          ],
        ),
      );

  _signUp() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            CustomTextField(
              hint: 'Username',
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              onChanged: (val) {
                _username = val;
              },
            ),
            SizedBox(height: 30.0),
            ..._emailAndPassword(),
            SizedBox(height: 30.0),
            CustomFlatButton(
                text: 'Sign up',
                size: Size(double.infinity, 54.0),
                onPressed: () async {
                  _showLoader();
                  signup(_email, _password, _username);
                }),
            SizedBox(height: 30.0),
            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                text: 'Already have an account?',
                style: Theme.of(context).textTheme.caption.copyWith(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                    ),
                children: [
                  TextSpan(
                    text: ' Sign in',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _controller.previousPage(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.elasticOut);
                      },
                  )
                ],
              ),
            )
          ],
        ),
      );

  List<Widget> _emailAndPassword() => [
        CustomTextField(
          hint: 'Email',
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
          onChanged: (val) {
            _email = val;
          },
        ),
        SizedBox(height: 30.0),
        CustomTextField(
          hint: 'Password',
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
          onChanged: (val) {
            _password = val;
          },
        )
      ];

  _showLoader() {
    var alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white70,
        ),
      ),
    );

    showDialog(
        context: context, barrierDismissible: true, builder: (_) => alert);
  }

  _hideLoader() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  signup(email, password, name) async {
    var url = "http://localhost:5000/signup"; // iOS
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'name': name,
      }),
    );

    print(response.body);

    _showToast(response.body);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var parse = jsonDecode(response.body);

    if (parse["token"] != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CompositionRoot.composeAuthUi()),
      );

    await prefs.setString('token', parse["token"]);
  }

  bool validateUser(username, password) {
    if (username.length == 0) {
      print("Username field is empty");
      _showToast(jsonEncode(<String, String>{
        'msg': "Username field is empty!",
      }));
      return false;
    } else if (username.length < 4) {
      print("Invalid Username: " +
          username +
          " The username should be at least 4 characters long");
      _showToast(jsonEncode(<String, String>{
        'msg': "Invalid Username: " +
            username +
            " The username should be at least 4 characters long",
      }));
      return false;
    }

    if (password.length == 0) {
      print("Password field is empty");
      _showToast(jsonEncode(<String, String>{
        'msg': "Password field is empty",
      }));
      return false;
    } else if (password.length < 4) {
      print("Invalid Password! " +
          "The password should be at least 4 characters long");
      _showToast(jsonEncode(<String, String>{
        'msg': "Invalid Password! " +
            "The password should be at least 4 characters long",
      }));
      return false;
    }

    return true;
  }

  login(email, password) async {
    var url = "http://localhost:5000/login"; // iOS
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    print(response.body);

    _showToast(response.body);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var parse = jsonDecode(response.body);

    await prefs.setString('token', parse["token"]);

    String token = prefs.getString("token");
    if (token != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CompositionRoot.composeAuthUi()),
      );
  }

  _showToast(response) {
    Map<String, dynamic> json = jsonDecode(response) as Map<String, dynamic>;
    String msg = json['msg'];

    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
        webPosition: "center");

    _hideLoader();
  }

  checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token");
    if (token != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }
}
