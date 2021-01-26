import 'package:flutter/material.dart';
import 'package:vidbusters/screens/starting.dart';
import 'package:vidbusters/shared/decorations.dart';
import 'package:vidbusters/providers/users.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  bool ok = false;

  @override
  Widget build(BuildContext context) {
    final currentuser = Provider.of<Users>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage('images/logo.png'),
                height: 270,
                width: 270,
              ),
              Form(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value.isEmpty ? "Enter an email address" : null,
                    decoration: textinputdecoration.copyWith(hintText: "Email"),
                    onChanged: (value) {
                      setState(() {
                        currentuser.email = value;
                        print(currentuser.email);
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) => value.length < 6
                        ? "The password must include at least 6 digits"
                        : null,
                    obscureText: true,
                    decoration:
                        textinputdecoration.copyWith(hintText: "password"),
                    onChanged: (value) {
                      setState(() {
                        currentuser.password = value;
                        print(currentuser.password);
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton.extended(
                      elevation: 10,
                      heroTag: "1",
                      label: Text("sign in", style: TextStyle(fontSize: 20)),
                      backgroundColor: Colors.red,
                      onPressed: () {
                        print(currentuser.email);
                        print(currentuser.password);
                        currentuser.fetchusersdata().then((_) {
                          setState(() {
                            ok = currentuser.isfound;
                          });
                          print(ok);
                        });
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton.extended(
                      elevation: 10,
                      heroTag: "2",
                      label: Text("sign up", style: TextStyle(fontSize: 20)),
                      backgroundColor: Colors.red,
                      onPressed: () {
                        Navigator.pushNamed(context, '/rigster');
                      }),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
