import 'package:data/entity/version.dart';

class Game_indices {

  int game_index;
  Version version;

	Game_indices.fromJsonMap(Map<String, dynamic> map): 
		game_index = map["game_index"],
		version = Version.fromJsonMap(map["version"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['game_index'] = game_index;
		data['version'] = version == null ? null : version.toJson();
		return data;
	}
}
