
import 'package:flutter/material.dart';
import 'package:spacexrokets/widget/loading_screen.dart';

class RocketDetailsLoading extends StatelessWidget {
  const RocketDetailsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        LoadingScreen(margin: 8, height: 350, width: MediaQuery.of(context).size.width,),
        LoadingScreen(margin: 8, height: 80, width: MediaQuery.of(context).size.width,),
        LoadingScreen(margin: 8, height: 30, width: MediaQuery.of(context).size.width,),
        LoadingScreen(margin: 8, height: 30, width: MediaQuery.of(context).size.width,),
        LoadingScreen(margin: 8, height: 30, width: MediaQuery.of(context).size.width,),
      ],
    );
  }
}
