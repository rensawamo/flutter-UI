import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/hospital_model.dart';
part 'hospital_provider.g.dart';

final dio = Dio();

@riverpod
Future<List<HospitalModel>> fetchHospitals(FetchHospitalsRef ref, {required double lat, required double lng, required String distance}) async {
  var response = await dio.get(
    'http://10.0.2.2:8083/hospital',
    queryParameters: {
      'lat': 35.6884204226699,
      'lng': 139.72515649841105,
      // 'lat': lat,
      // 'lng': lng,
      'distance': distance,
    },
  );
  List<HospitalModel> hospitals = [
    for (var item in response.data) HospitalModel.fromJson(item)
  ];
  return hospitals;
}


