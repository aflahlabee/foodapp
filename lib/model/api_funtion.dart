import 'package:food_delivery/model/modelClass.dart';
import 'package:http/http.dart' as http;

Future<List<Model>> fetchdata() async {
  final response = await http
      .get(Uri.parse('https://www.mocky.io/v2/5dfccffc310000efc8d2c1ad'));
  final finaldata = modelFromJson(response.body);
  print(finaldata[0].restaurantImage.toString());
  return finaldata;
}
