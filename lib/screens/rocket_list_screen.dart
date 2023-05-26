import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spacexrokets/error_handling/connection_failed.dart';
import 'package:spacexrokets/providers/rocket_provider.dart';
import 'package:spacexrokets/screens/rocket_details_screen.dart';
import 'package:spacexrokets/widget/rocket_loading.dart';

class RocketListScreen extends StatelessWidget {
  const RocketListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('SpaceX Rockets'),
      ),
      body: Consumer(
        builder: (context, watch, _) {
          final rocketsAsyncValue = watch.watch(rocketProvider);
          return rocketsAsyncValue.when(
            data: (rockets) => ListView.builder(
              itemCount: rockets.length,
              itemBuilder: (context, index) {
                final rocket = rockets[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RocketDetailsScreen(rocketName: rocket.name, rocketId: rocket.id,)));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    elevation: 20,
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.network(
                          rocket.rocketImage,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16,bottom: 16),
                          child: Column(
                            children: [
                                    Text(
                                      rocket.name,
                                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('Country: ',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                        Text(rocket.country,style: const TextStyle(fontSize: 18,))
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text('Engines Count: ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                        Text(rocket.enginesCount.toString(),style: const TextStyle(fontSize: 18,),)
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            loading: () => ListView.separated(
              separatorBuilder: (context,index) => const SizedBox(height: 25),
              itemCount: 5,
              itemBuilder: (context, index) => const RocketLoading(),
            ),
            error: (error, stackTrace) => const ConnectionFailed(),
          );
        },
      ),
    );
  }
}
