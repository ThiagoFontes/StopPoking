import 'package:data/entity/stat.dart';

class Stats {

  int base_stat;
  int effort;
  Stat stat;

	Stats.fromJsonMap(Map<String, dynamic> map): 
		base_stat = map["base_stat"],
		effort = map["effort"],
		stat = Stat.fromJsonMap(map["stat"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['base_stat'] = base_stat;
		data['effort'] = effort;
		data['stat'] = stat == null ? null : stat.toJson();
		return data;
	}
}
