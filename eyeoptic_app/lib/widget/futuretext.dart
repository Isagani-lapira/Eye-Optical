import 'package:flutter/material.dart';

class FutureText extends StatelessWidget {
  final Future<String?> futureTxt;
  final TextStyle? style;
  const FutureText({super.key, required this.futureTxt, this.style});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureTxt,
      builder: ((context, snapshot) {
        String text;
        if (snapshot.connectionState == ConnectionState.waiting) {
          text = 'Loading';
        } else if (snapshot.hasError) {
          text = 'Error';
        } else {
          text = snapshot.data ?? 'Not available';
        }
        return Text(text, style: style);
      }),
    );
  }
}
