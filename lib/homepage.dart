import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/img4.png'),
                        fit: BoxFit.contain)),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(
                controller: _usernameController,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              const SizedBox(
                height: 20,
              ),
              TextField(

                controller: _passwordController,
                textInputAction: TextInputAction.go,
                obscureText: true,
                decoration: InputDecoration(
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    fillColor: Colors.grey.shade100,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.deepPurple,
                      minimumSize: const Size(340, 40)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Confirm"),
                          content: Text(_usernameController.text + " "+ _passwordController.text ),
                          actions: [
                        TextButton(
                        child: Text("OK"),
                        onPressed: () { },
                        ),
                          ],
                        );
                      },
                    );


                  },
                  child: const Text('Log in')),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: const Size(340, 40),
                      side: const BorderSide(color: Colors.black)),
                  onPressed: () {},
                  child: const Text('Sign up')),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black
                ),
                  onPressed: () {},
                  child: const Text('Forget password')),
            ],
          ),
        ),
      ),
    );
  }
}
