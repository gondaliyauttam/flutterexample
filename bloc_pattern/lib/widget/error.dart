import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String message;
  final Function ontap;

  const Error({Key key, this.message, this.ontap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: InkWell(
          onTap: ontap,
          child: Container(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
