import 'package:flutter/material.dart';

import 'package:e_commerce/features/tab/tab_screen.dart';
import 'package:e_commerce/widgets/custom_form_field.dart';
import 'package:e_commerce/widgets/custom_button.dart';
import 'package:e_commerce/utils/form_validators.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});
  @override
  State<AuthenticationScreen> createState() {
    return _AuthenticationScreenState();
  }
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool _isLogin = true;
  final _formKey = GlobalKey<FormState>();
  var _enteredFirstName = '';
  var _enteredLastName = '';
  var _enteredPhoneNo = '';
  var _enteredEmail = '';
  var _enteredPassword = '';

  void _login(BuildContext context) {
    if(!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TabScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _isLogin ? "LogIn" : "SignUp",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 46,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    if (!_isLogin)
                      Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: CustomFormField(
                                labelText: 'First Name',
                                validator: (value) =>
                                    FormValidator.validateName(value),
                                onSaved: (value) => _enteredFirstName = value!,
                              )),
                          const Spacer(),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: CustomFormField(
                                labelText: 'Last Name',
                                validator: (value) =>
                                    FormValidator.validateName(value),
                                onSaved: (value) => _enteredLastName = value!,
                              ))
                        ],
                      ),
                    if (!_isLogin) const SizedBox(height: 14),
                    CustomFormField(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      hintText: "ID | example@gmail.com",
                      validator: (value) => FormValidator.validateEmail(value),
                      onSaved: (value) => _enteredEmail = value!,
                    ),
                    const SizedBox(height: 14),
                    if (!_isLogin)
                      CustomFormField(
                        labelText: 'Phone Number',
                        prefixText: '+91',
                        keyboardType: TextInputType.phone,
                        validator: (value) =>
                            FormValidator.validatePhoneNumber(value),
                        onSaved: (value) => _enteredPhoneNo = value!,
                      ),
                    if (!_isLogin) const SizedBox(height: 14),
                    CustomFormField(
                      labelText: "Password",
                      toggleVisibility: true,
                      suffixIcon: Icon(Icons.remove_red_eye),
                      validator: (value) =>
                          FormValidator.validatePassword(value),
                      onSaved: (value) => _enteredPassword = value!,
                    ),
                    const SizedBox(height: 18),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        text: _isLogin ? 'LogIn' : 'SignUp',
                        onPressed: () {
                          _login(context);
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          _isLogin
                              ? 'Don\'t have an account?'
                              : 'Already have an account?',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: Text(
                            _isLogin ? 'SignUp' : 'LogIn',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
