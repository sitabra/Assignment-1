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
  final _formKey = GlobalKey<_HomePageState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: _formKey,
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
                height: 20,
              ),
              TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: _usernameController,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      labelText: 'Username',
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
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.white,
                      primary: Colors.deepPurple,
                      minimumSize: const Size(323, 40)),
                  onPressed: () {
                    _usernameController.text.isEmpty ||
                            _passwordController.text.isEmpty
                        ? null
                        : showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Confirm"),
                                content: Text(_usernameController.text +
                                    " :Username"
                                        "\n " +
                                    _passwordController.text +
                                    " :Password"),
                                actions: [
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
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
                      minimumSize: const Size(323, 40),
                      side: const BorderSide(color: Colors.black)),
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                  child: const Text('Sign up')),
              TextButton(
                  style: TextButton.styleFrom(primary: Colors.black),
                  onPressed: () {},
                  child: const Text('Forget password')),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Terms of use. Privacy policy',
                style: TextStyle(
                  decoration: TextDecoration.none,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
