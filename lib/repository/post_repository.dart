import 'dart:convert';

import 'package:apibloc/model/postmodel.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  var api = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<PostModel>> fetchdatafromserver() async {
    try {
      final response = await http.get(Uri.parse(api));
      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return PostModel(
              postId: e['postId'] as int,
              id: e['id'] as int,
              name: e['name'] as String,
              email: e['email'] as String,
              body: e['body'] as String);
        }).toList();
      } else {
        print("the status code is not 200 and it's problem");
        throw Exception('statuscode is not 200');
      }
    } catch (e) {
      throw Exception('error while fetching data : $e');
    }
  }
}
