import 'package:data/entity/abilities.dart';
import 'package:data/entity/forms.dart';
import 'package:data/entity/game_indices.dart';
import 'package:data/entity/moves.dart';
import 'package:data/entity/species.dart';
import 'package:data/entity/sprites.dart';
import 'package:data/entity/stats.dart';
import 'package:data/entity/types.dart';

class Pokemon {

  List<Abilities> abilities;
  int base_experience;
  List<Forms> forms;
  List<Game_indices> game_indices;
  int height;
  List<Object> held_items;
  int id;
  bool is_default;
  String location_area_encounters;
  List<Moves> moves;
  String name;
  int order;
  Species species;
  Sprites sprites;
  List<Stats> stats;
  List<Types> types;
  int weight;

	Pokemon.fromJsonMap(Map<String, dynamic> map): 
		abilities = List<Abilities>.from(map["abilities"].map((it) => Abilities.fromJsonMap(it))),
		base_experience = map["base_experience"],
		forms = List<Forms>.from(map["forms"].map((it) => Forms.fromJsonMap(it))),
		game_indices = List<Game_indices>.from(map["game_indices"].map((it) => Game_indices.fromJsonMap(it))),
		height = map["height"],
		held_items = map["held_items"],
		id = map["id"],
		is_default = map["is_default"],
		location_area_encounters = map["location_area_encounters"],
		moves = List<Moves>.from(map["moves"].map((it) => Moves.fromJsonMap(it))),
		name = map["name"],
		order = map["order"],
		species = Species.fromJsonMap(map["species"]),
		sprites = Sprites.fromJsonMap(map["sprites"]),
		stats = List<Stats>.from(map["stats"].map((it) => Stats.fromJsonMap(it))),
		types = List<Types>.from(map["types"].map((it) => Types.fromJsonMap(it))),
		weight = map["weight"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['abilities'] = abilities != null ? 
			this.abilities.map((v) => v.toJson()).toList()
			: null;
		data['base_experience'] = base_experience;
		data['forms'] = forms != null ? 
			this.forms.map((v) => v.toJson()).toList()
			: null;
		data['game_indices'] = game_indices != null ? 
			this.game_indices.map((v) => v.toJson()).toList()
			: null;
		data['height'] = height;
		data['held_items'] = held_items;
		data['id'] = id;
		data['is_default'] = is_default;
		data['location_area_encounters'] = location_area_encounters;
		data['moves'] = moves != null ? 
			this.moves.map((v) => v.toJson()).toList()
			: null;
		data['name'] = name;
		data['order'] = order;
		data['species'] = species == null ? null : species.toJson();
		data['sprites'] = sprites == null ? null : sprites.toJson();
		data['stats'] = stats != null ? 
			this.stats.map((v) => v.toJson()).toList()
			: null;
		data['types'] = types != null ? 
			this.types.map((v) => v.toJson()).toList()
			: null;
		data['weight'] = weight;
		return data;
	}
}
