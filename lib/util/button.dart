import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  MyButton({super.key,
  required this.text,
    required this. onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(decoration: BoxDecoration(
          color: Colors.deepPurple[300],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(
            color: Colors.deepPurple.shade700,
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
                      BoxShadow(
              color: Colors.deepPurple.shade200,
              offset: Offset(0, -4),
              blurRadius: 10,
              spreadRadius: 1,
            ),],
          gradient: LinearGradient(begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade200,
                Colors.deepPurple.shade400
              ],
              stops: [0.02, 0.98]),
      ),
          width: 100,
        height: 50,
        child: Center(child: Text(text))),
    );
  }
   /* return MaterialButton(onPressed: onPressed,
    color: Colors.deepPurple
    child: Text(text),);
  }*/
}
