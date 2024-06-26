import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String labelTxt;
  final String hint;
  final bool obscure;
  final Function onChange;
  final double width;
  const CustomField({
    super.key,
    required this.labelTxt,
    required this.hint,
    required this.onChange,
    this.obscure = false,
    this.width = 0.40,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelTxt,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.start,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          width: MediaQuery.of(context).size.width * width,
          child: TextFormField(
            autofocus: false,
            obscureText: obscure,
            decoration: InputDecoration(
              hintText: hint,
              border: Theme.of(context).inputDecorationTheme.border,
            ),
            onChanged: (value) {
              onChange(value);
            },
          ),
        ),
      ],
    );
  }
}
