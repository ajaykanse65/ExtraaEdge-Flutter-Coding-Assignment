import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spacexrokets/models/rocketList.dart';

import 'package:spacexrokets/models/rocket_details.dart';
import 'package:spacexrokets/services/api_service.dart';


final rocketProvider = FutureProvider<List<Rocket>>((ref) async {
  return APIService.getRockets();
});

final rocketDetailsProvider = FutureProvider.family<RocketDetails, String>((ref, rocketId) async {
  return APIService.getRocketDetails(rocketId);
});
