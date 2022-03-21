import 'package:flutter/material.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController _username1Controller = TextEditingController();
  TextEditingController _password1Controller = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstnameController = TextEditingController();
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/img4.png'),
                        fit: BoxFit.contain)),
              ),
              SizedBox(
                  height: 10,
              ),
              TextField(
                controller: _firstnameController,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                  fillColor: Colors.black12,
                  labelText: 'First Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _username1Controller,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                    fillColor: Colors.black12,
                    labelText: 'Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _emailController,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                    fillColor: Colors.black12,
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _password1Controller,
                textInputAction: TextInputAction.go,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.black12,
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: Colors.black12,
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                  activeColor: Colors.deepPurple,
                  value: checkBoxValue,
                  title: Text('I agree with terms and conditions'),
                  onChanged: (value) {
                setState(() {
                  checkBoxValue = value!;
                });
              }
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
                          content:

                          Text(_firstnameController.text + " :First name "
                              "\n"+ _username1Controller.text + " :Username "
                              "\n"+ _emailController.text + " :Email"
                              "\n"+ _password1Controller.text +" :Password"),
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
                  child: const Text('Sign up')
              ),
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.black
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Already have an account? Sign in',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  )
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
