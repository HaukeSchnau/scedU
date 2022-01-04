import 'package:mobx/mobx.dart';
import '../gen/basic_location.dart';
  
part 'location.g.dart';

class Location = _Location with _$Location;

abstract class _Location extends BasicLocation with Store {
  _Location(
      {required double long,
      required double lat,
      required String id}) : super(long: long, lat: lat, id: id);

  // ignore: unused_element
  _Location.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
