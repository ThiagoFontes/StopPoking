
class Move_learn_method {

  String name;
  String url;

	Move_learn_method.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		url = map["url"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['url'] = url;
		return data;
	}
}
