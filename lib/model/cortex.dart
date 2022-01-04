import 'package:mobx/mobx.dart';
import '../gen/basic_cortex.dart';
  
part 'cortex.g.dart';

class Cortex = _Cortex with _$Cortex;

abstract class _Cortex extends BasicCortex with Store {
  _Cortex(
      {required String title,
      String? description,
      required String id}) : super(title: title, description: description, id: id);

  // ignore: unused_element
  _Cortex.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
