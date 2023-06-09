import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  final Function()? onTap;

  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(67, 236, 227, 1),
                Color.fromRGBO(20, 188, 233, 1)
              ],
            )),
        child: Center(
            child: Text(
          "Sign In",
          style: TextStyle(
            fontFamily: "SourceSansPro",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
