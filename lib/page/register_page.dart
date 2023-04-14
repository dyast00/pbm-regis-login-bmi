import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

List username = [];
List password = [];

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final _key = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO : Buat tampilan register
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Ini rejister"),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Form(
          key: _key,
          // padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  "Registrasi",
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
                  if (_key.currentState!.validate()) {
                    username.add(_username.text);
                    password.add(_password.text);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(
                            username: username,
                            password: password,
                          ),
                        ));
                    // Navigator.of(context).pushNamed("/login");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("isi dulu cuy")),
                    );
                  }
                },
                child: Text("Daftar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
