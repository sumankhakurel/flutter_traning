import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:demo2/pages/api_Example/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  Future<void> getPost() async {
    try {
      emit(PostLoading());
      final response = await http.get(Uri.parse(
          "https://677ff57e0476123f76a8ec27.mockapi.io/api/post/post"));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<PostModel> posts = data
            .map(
              (post) => PostModel.fromjson(post),
            )
            .toList();

        emit(PostLoaded(posts: posts));
      } else {
        throw response.body;
      }
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }

  Future<void> postPost(PostModel post) async {
    try {
      emit(PostLoading());

      final response = await http.post(
          Uri.parse(
              "https://677ff57e0476123f76a8ec27.mockapi.io/api/post/post"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(post.toJson()));

      if (response.statusCode == 200 || response.statusCode == 201) {
        getPost();
      } else {
        throw response.body;
      }
    } catch (e) {
      emit(PostError(message: e.toString()));
    }
  }
}
