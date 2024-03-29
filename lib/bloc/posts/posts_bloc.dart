
import 'package:bloc_basic/bloc/posts/posts_event.dart';
import 'package:bloc_basic/bloc/posts/posts_state.dart';
import 'package:bloc_basic/model/posts_model.dart';
import 'package:bloc_basic/repository/post_repository.dart';
import 'package:bloc_basic/utils/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostsEvent, PostsStates>{
   List<PostModel> tempPostList = [];
  PostRepository  postRepository = PostRepository();
  PostBloc(): super(const PostsStates()){
    on<PostFetched> (fetchPostApi);
    on<SearchItem> (_filterList);
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
  void _filterList(SearchItem event, Emitter<PostsStates> emitter){
    if(event.stsSearch.isEmpty){
      emitter(state.copyWith(tempPostList: [], searchMessage: ''));

    }
    else{
     // tempPostList = state.postList.where((element) => element.email.toString() == event.stsSearch.toString()).toList();
      tempPostList = state.postList.where((element) => element.email.toString().toLowerCase().contains(event.stsSearch.toLowerCase())).toList();
      if(tempPostList.isEmpty){
        emitter(state.copyWith(tempPostList: tempPostList, searchMessage: 'No data was found'));

      }
      else{
        emitter(state.copyWith(tempPostList: tempPostList));

      }

    }



  }
}