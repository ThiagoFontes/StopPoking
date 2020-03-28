
class Sprites {

  String back_default;
  Object back_female;
  String back_shiny;
  Object back_shiny_female;
  String front_default;
  Object front_female;
  String front_shiny;
  Object front_shiny_female;

	Sprites.fromJsonMap(Map<String, dynamic> map): 
		back_default = map["back_default"],
		back_female = map["back_female"],
		back_shiny = map["back_shiny"],
		back_shiny_female = map["back_shiny_female"],
		front_default = map["front_default"],
		front_female = map["front_female"],
		front_shiny = map["front_shiny"],
		front_shiny_female = map["front_shiny_female"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['back_default'] = back_default;
		data['back_female'] = back_female;
		data['back_shiny'] = back_shiny;
		data['back_shiny_female'] = back_shiny_female;
		data['front_default'] = front_default;
		data['front_female'] = front_female;
		data['front_shiny'] = front_shiny;
		data['front_shiny_female'] = front_shiny_female;
		return data;
	}
}
