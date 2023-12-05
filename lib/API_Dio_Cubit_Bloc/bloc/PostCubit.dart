import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/API_Dio_Cubit_Bloc/bloc/PostState.dart';
import 'package:getx_test/API_Dio_Cubit_Bloc/model/PostModel.dart';
import 'package:getx_test/API_Dio_Cubit_Bloc/repo/PostRepo.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()){
    fetchPosts();
  }

  PostRepo postRepo = PostRepo();

  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepo.fetchPost();
      emit(PostLoadedState(posts));
    } catch (ex) {
      emit(PostErrorState(ex.toString()));
    }
  }
}
