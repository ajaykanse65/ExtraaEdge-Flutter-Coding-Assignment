import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spacexrokets/error_handling/connection_failed.dart';
import 'package:spacexrokets/providers/rocket_provider.dart';
import 'package:spacexrokets/widget/rocket_details_loading.dart';
import 'package:url_launcher/url_launcher.dart';


class RocketDetailsScreen extends StatelessWidget {
  final String rocketId;
  final String rocketName;

  const RocketDetailsScreen(
      {super.key, required this.rocketId, required this.rocketName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(rocketName,style: const TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Consumer(
        builder: (context, WidgetRef ref, _) {
          final rocketDetailsAsyncValue = ref.watch(
              rocketDetailsProvider(rocketId,));
          return rocketDetailsAsyncValue.when(
            data: (rocket) =>
            Stack(
              children: [
                SizedBox(
                    height: 350,
                    child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: rocket.flickrImages.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      rocket.flickrImages[index],
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                  );
                                },
                              ),
                  ),
                DraggableScrollableSheet(
                  initialChildSize: 0.5,
                    maxChildSize: 1.0,
                    minChildSize: 0.5,
                    builder: (context, scrollController){
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Padding(
                            padding: const EdgeInsets.all(05.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,bottom: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 5,
                                        width: 35,
                                        color: Colors.black12,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                const Text('Description',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
                                const SizedBox(height: 5,),
                                Text(rocket.description,style: const TextStyle(color: Colors.black,fontSize: 16,letterSpacing: 0.4),),
                                const Divider(thickness: 1,),
                                const SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Active Status',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                                    Text(rocket.active ? "Yes" : "No", style: const TextStyle(fontSize: 18,color: Colors.black,letterSpacing: 0.4),
                                    )
                                  ],
                                ),
                                const Divider(thickness: 1,),
                                const SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Cost per launch',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                                    Text('${rocket.costPerLaunch.toString()} ₹', style: const TextStyle(fontSize: 18,color: Colors.black,letterSpacing: 0.4),
                                    )
                                  ],
                                ),
                                const Divider(thickness: 1,),
                                const SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Success Rate percent',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                                    Text('${rocket.successRatePct.toStringAsFixed(2)}%', style: const TextStyle(fontSize: 18,color: Colors.black,letterSpacing: 0.4),
                                    )
                                  ],
                                ),
                                const Divider(thickness: 1,),
                                const SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Wikipedia',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                                    Row(
                                      children: [
                                        InkWell(
                                                    onTap: () {
                                                      _launchUrl(rocket.wikipedia,);
                                                    },
                                                    child: const Text(
                                                      'https://en.wikipedia.org',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.blue,
                                                        decoration: TextDecoration.underline,
                                                      ),
                                                    ),
                                                  ),const SizedBox(width: 5,),
                                        const Icon(Icons.arrow_forward_ios_outlined,size: 16,color: Colors.blue,)
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(thickness: 1,),
                                const SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Height',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                                     Text("${rocket.height.feet.toString()} Feet", style: const TextStyle(fontSize: 18,color: Colors.black,letterSpacing: 0.4),)
                                  ],
                                ),
                                const Divider(thickness: 1,),
                                const SizedBox(height: 10,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Diameter',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                                    Text("${rocket.diameter.feet.toString()} Feet", style: const TextStyle(fontSize: 18,color: Colors.black,letterSpacing: 0.4),)
                                  ],
                                ),
                                const Divider(thickness: 1,)
                              ],
                            ),
                          ),
                        ),
                  );
                })
              ],
            ),

            loading: () => const RocketDetailsLoading(),
            error: (error, stackTrace) => const ConnectionFailed(),
          );
        },
      ),
    );
  }

  Future<void> _launchUrl(String urls) async {
    final Uri url = Uri.parse(urls);
    if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
