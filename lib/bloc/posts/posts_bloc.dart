
import 'package:bloc_basic/bloc/posts/posts_event.dart';
import 'package:bloc_basic/bloc/posts/posts_state.dart';
import 'package:bloc_basic/repository/post_repository.dart';
import 'package:bloc_basic/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostsEvent, PostsStates>{
  PostRepository  postRepository = PostRepository();
  PostBloc(): super(const PostsStates()){
    on<PostFetched> (fetchPostApi);
  }
  void fetchPostApi(PostFetched event, Emitter<PostsStates> emitter) async{
    await postRepository.fetchPost().then((value){
      emitter(state.copyWith(postStatus: PostStatus.success, message: 'success', postList: value));


    }).onError((error, stackTrace){
      print(error);
      print(stackTrace);
      emitter(state.copyWith(postStatus: PostStatus.failure, message: error.toString()));

    });


  }
}