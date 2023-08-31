import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/screens/home.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final counter = useState(0);
    Map userData = {};
    final _formkey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 200,
                    height: 120,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  Text(
                    'CONSOAR',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text('Intelligent Landfill Monitoring',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    EmailField(),
                    PasswordField(),
                    SubmitButton(formkey: _formkey),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required GlobalKey<FormState> formkey,
  }) : _formkey = formkey;

  final GlobalKey<FormState> _formkey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(28.0),
      child: SizedBox(
        child: TextButton(
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          onPressed: () {
            if (_formkey.currentState!.validate()) {
              print('form submitted');

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
          },
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(30)),
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)),
        ),
        width: MediaQuery.of(context).size.width,
        height: 50,
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0),
      child: TextFormField(
        obscureText: true,
        enableSuggestions: true,
        autocorrect: false,
        validator: MultiValidator([
          RequiredValidator(errorText: 'Please enter Password'),
          MinLengthValidator(8, errorText: 'Password must be at least 8 digit'),
          PatternValidator(r'(?=.*?[#!@$%^&*-])',
              errorText: 'Password must be at least one special character')
        ]),
        decoration: const InputDecoration(
          hintText: 'Password',
          labelText: 'Password',
          prefixIcon: Icon(
            Icons.key,
            color: Colors.green,
          ),
          errorStyle: TextStyle(fontSize: 18.0),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(9.0))),
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0),
        child: TextFormField(
            validator: MultiValidator([
              RequiredValidator(errorText: 'Enter email address'),
              EmailValidator(errorText: 'Please correct email filled'),
            ]),
            decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.email,
                  //color: Colors.green,
                ),
                errorStyle: TextStyle(fontSize: 18.0),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(9.0))))));
  }
}
