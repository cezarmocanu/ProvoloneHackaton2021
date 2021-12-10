import 'package:http/http.dart';

class TodoRepo {
  const TodoRepo._internal();

  static const TodoRepo instance = TodoRepo._internal();

  Future<Response> getAllTasks() async {
    Uri url = Uri.https("jsonplaceholder.typicode.com", "todos");

    try {
      Response response = await get(url);
      //Done only for exemplifications of a request taking time
      await Future.delayed(const Duration(seconds: 3));
      return response;
    } on Exception catch (e) {
      throw e;
    }
  }
}
