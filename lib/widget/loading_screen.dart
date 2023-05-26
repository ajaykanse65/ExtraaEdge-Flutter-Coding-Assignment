import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final double? height, width,  margin;
  const LoadingScreen({Key? key, required this.height, required this.width, required this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: height,
      width: width,
      margin:  EdgeInsets.all(margin!),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: const BorderRadius.all(Radius.circular(25))
      ),
    );
  }
}
