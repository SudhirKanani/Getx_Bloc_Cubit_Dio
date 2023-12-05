import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getx_test/API_Dio_Cubit_Bloc/bloc/PostCubit.dart';
import 'package:getx_test/API_Dio_Cubit_Bloc/bloc/PostState.dart';
import 'package:getx_test/API_Dio_Cubit_Bloc/model/PostModel.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api DIO"),
        centerTitle: true,
      ),
      body: SafeArea(child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostLoadedState) {
            return buidePostItemView(state.posts);
          }

          return Center(
            child: Text("Error occurred!!"),
          );
        },
      )),
    );
  }

  Widget buidePostItemView(List<PostModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        PostModel postModel = posts[index];
        return ListTile(
          title: Text(postModel.title.toString()),
          subtitle: Text(postModel.body.toString()),
        );
      },
    );
  }
}
