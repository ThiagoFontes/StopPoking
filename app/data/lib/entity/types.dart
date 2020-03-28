import 'package:data/entity/type_item.dart';

class Types {

  int slot;
  TypeItem type;

	Types.fromJsonMap(Map<String, dynamic> map): 
		slot = map["slot"],
		type = TypeItem.fromJsonMap(map["type"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['slot'] = slot;
		data['type'] = type == null ? null : type.toJson();
		return data;
	}
}
