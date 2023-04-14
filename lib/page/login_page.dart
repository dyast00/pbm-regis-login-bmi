import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.username, required this.password});
  final username;
  final password;
  final _key = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO : Buat tampilan register
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Ini lojin"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 34, fontWeight: FontWeight.w700, height: 1.5),
                ),
              ),
              TextFormField(
                controller: _username,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'isi dulu coy';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                obscureText: true,
                controller: _password,
                decoration: InputDecoration(
                  labelText: "password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'isi dulu coy';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 32.0,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_username.text.toString() != username[0].toString() ||
                      _password.text.toString() != password[0].toString()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Username atau password salah cuy")),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(username: username),
                      ),
                    );
                    // Navigator.of(context).pushNamed("/homepage");
                  }
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
