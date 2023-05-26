
import 'package:flutter/widgets.dart';
import 'package:spacexrokets/widget/loading_screen.dart';

class RocketLoading extends StatelessWidget {
  const RocketLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        LoadingScreen(height: 200, width: double.infinity, margin: 16,),
        LoadingScreen(height: 14, width: 100, margin: 6.5,),
        LoadingScreen(height: 14, width: 300, margin: 1.8,),
        LoadingScreen(height: 14, width: 100, margin: 4.6,),
      ],
    );
  }
}
