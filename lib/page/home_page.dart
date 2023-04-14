import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.username});
  final username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _tinggi = TextEditingController();
  final TextEditingController _berat = TextEditingController();
  String kondisi = "blom input";
  int bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Ini bmi"),
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
                child: Text(
                  "Welcome " + username[0],
                  style: TextStyle(
                      fontSize: 34, fontWeight: FontWeight.w700, height: 1.5),
                ),
              ),
              Container(
                child: Text(
                  "BMI mu = " + bmi.toString(),
                  style: TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w500, height: 1.5),
                ),
              ),
              Container(
                child: Text(
                  "Kamu " + kondisi,
                  style: TextStyle(
                      fontSize: 28, fontWeight: FontWeight.w500, height: 1.5),
                ),
              ),
              TextFormField(
                controller: _tinggi,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Tinggi (cm)",
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
                controller: _berat,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "berat (kg)",
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
                  int bb = int.parse(_berat.text);
                  int tb = int.parse(_tinggi.text);
                  setState(() {
                    bmi = (bb / ((tb / 100) * (tb / 100))).round().toInt();
                    if (bmi >= 18.5 && bmi <= 25) {
                      kondisi = "Normal";
                    } else if (bmi > 25 && bmi <= 30) {
                      kondisi = "Overweight";
                    } else if (bmi > 30) {
                      kondisi = "Obesity";
                    } else {
                      kondisi = "Underweight";
                    }
                  });
                },
                child: Text("Hitung"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
