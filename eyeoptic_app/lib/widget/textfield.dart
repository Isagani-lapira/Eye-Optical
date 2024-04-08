import 'package:eyeoptic_app/utils/string.dart';
import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
  final String labelTxt;
  final String hint;
  final bool obscure;
  const CustomField({
    super.key,
    required this.labelTxt,
    required this.hint,
    this.obscure = false,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelTxt,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          width: MediaQuery.of(context).size.width * 0.40,
          child: TextFormField(
            autofocus: false,
            obscureText: widget.obscure,
            decoration: InputDecoration(
              hintText: widget.hint,
              border: Theme.of(context).inputDecorationTheme.border,
            ),
          ),
        ),
      ],
    );
  }
}
