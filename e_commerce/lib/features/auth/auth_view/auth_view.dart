import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce/features/auth/widgets/widgets.dart'; // custom button and form field
import 'package:e_commerce/features/auth/form_validators.dart';
import 'package:e_commerce/features/auth/auth_view_model.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(authViewModelProvider);
    final vm = ref.read(authViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: viewModel.formKey,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      viewModel.isLogin ? "LogIn" : "SignUp",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 46,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    if (!viewModel.isLogin)
                      Row(
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: CustomFormField(
                                labelText: 'First Name',
                                validator: (value) =>
                                    FormValidator.validateName(value),
                                onSaved: (value) =>
                                    vm.saveField('firstName', value ?? ''),
                              )),
                          const Spacer(),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: CustomFormField(
                                labelText: 'Last Name',
                                validator: (value) =>
                                    FormValidator.validateName(value),
                                onSaved: (value) =>
                                    vm.saveField('lastName', value ?? ''),
                              ))
                        ],
                      ),
                    if (!viewModel.isLogin) const SizedBox(height: 14),
                    CustomFormField(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      hintText: "ID | example@gmail.com",
                      validator: (value) => FormValidator.validateEmail(value),
                      onSaved: (value) => vm.saveField('email', value ?? ''),
                    ),
                    const SizedBox(height: 14),
                    if (!viewModel.isLogin)
                      CustomFormField(
                        labelText: 'Phone Number',
                        prefixText: '+91',
                        keyboardType: TextInputType.phone,
                        validator: (value) =>
                            FormValidator.validatePhoneNumber(value),
                        onSaved: (value) => vm.saveField('phone', value ?? ''),
                      ),
                    if (!viewModel.isLogin) const SizedBox(height: 14),
                    CustomFormField(
                      labelText: "Password",
                      toggleVisibility: true,
                      suffixIcon: Icon(Icons.remove_red_eye),
                      validator: (value) =>
                          FormValidator.validatePassword(value),
                      onSaved: (value) => vm.saveField('password', value ?? ''),
                    ),
                    const SizedBox(height: 18),
                    Align(
                      alignment: Alignment.center,
                      child: CustomButton(
                        text: viewModel.isLogin ? 'LogIn' : 'SignUp',
                        onPressed: () {
                          vm.validateAndSave();
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          viewModel.isLogin
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
                          onPressed: viewModel.toggleMode,
                          child: Text(
                            viewModel.isLogin ? 'SignUp' : 'LogIn',
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
