import '../gen/basic_location.dart';
  
class Location extends BasicLocation {
  Location(
      {required double long,
      required double lat,
      required String id}) : super(long: long, lat: lat, id: id);

  Location.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
