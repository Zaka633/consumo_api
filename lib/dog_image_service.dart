import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dog_image_model.dart';

class DogImageService {
  final String _url = 'https://dog.ceo/api/breeds/image/random';

  Future<DogImage?> fetchDogImage() async {
    try {
      final response = await http.get(Uri.parse(_url));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return DogImage.fromJson(data);
      } else {
        throw Exception('deu erro');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
