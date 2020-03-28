import 'package:data/entity/move.dart';
import 'package:data/entity/version_group_details.dart';

class Moves {

  Move move;
  List<Version_group_details> version_group_details;

	Moves.fromJsonMap(Map<String, dynamic> map): 
		move = Move.fromJsonMap(map["move"]),
		version_group_details = List<Version_group_details>.from(map["version_group_details"].map((it) => Version_group_details.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['move'] = move == null ? null : move.toJson();
		data['version_group_details'] = version_group_details != null ? 
			this.version_group_details.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
