import 'package:dio/dio.dart';
import 'package:getx_test/API_Dio_Cubit_Bloc/model/PostModel.dart';
import 'package:getx_test/API_Dio_Cubit_Bloc/repo/api/Api.dart';

class PostRepo {
  final Api api = Api();

  Future<List<PostModel>> fetchPost() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postList =  response.data;
      return postList.map((postItem) => PostModel.fromJson(postItem)).toList();
    } catch (ex) {
      throw ex;
    }
  }
}
