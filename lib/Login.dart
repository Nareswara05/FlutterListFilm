import 'package:Super_Cinemas/HomePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget myText(String label, bool isObsecure) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextField(
        obscureText: isObsecure,
        style: TextStyle(color: Colors.white), // Ganti warna font menjadi putih
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          labelStyle: TextStyle(color: Colors.white), // Ganti warna label menjadi putih
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/Rev.png', // Ganti dengan path logo Netflix Anda
                height: 150,
                fit: BoxFit.cover,
              ),
              myText("Email or Phone", false),
              myText("Password", true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text('Sign In', style: TextStyle(color: Colors.white)), // Ganti warna font menjadi putih
              ),
              SizedBox(height: 10),
              Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900], // Ganti warna sesuai dengan Netflix
                ),
                child: Text('Sign Up', style: TextStyle(color: Colors.purple)), // Ganti warna font menjadi ungu
              ),
            ],
          ),
        ),
      ),
    );
  }
}
