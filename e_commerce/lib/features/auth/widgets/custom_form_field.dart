import 'package:flutter/material.dart';

class CustomFormField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool? toggleVisibility;
  final String? prefixText;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;
  const CustomFormField(
      {super.key,
      required this.labelText,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.prefixText,
        this.keyboardType,
        this.validator,
        this.onSaved,
      this.toggleVisibility = false});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor:
                Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Colors.green,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: Colors.deepOrange,
                width: 2.0,
              ),
            ),
            prefixIcon: widget.prefixIcon,
            prefixIconColor: Colors.white,
            suffixIcon: widget.toggleVisibility!
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: _obscureText
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  )
                : widget.suffixIcon,
            suffixIconColor: Colors.white,
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimary
                      .withValues(alpha: 0.70),
                ),
            prefixText: widget.prefixText,
          ),
          keyboardType: widget.keyboardType,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          obscureText: widget.toggleVisibility! ? _obscureText : false,
          validator: widget.validator,
          onSaved: widget.onSaved,
          cursorColor: Theme.of(context).colorScheme.onPrimary,
        ),
      ],
    );
  }
}
