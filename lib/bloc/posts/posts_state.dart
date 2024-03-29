import 'package:bloc_basic/model/posts_model.dart';
import 'package:bloc_basic/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostsStates extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;
  final String message;
  final String searchMessage;

  const PostsStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.tempPostList = const <PostModel> [],
    this.message = '',
    this.searchMessage = '',

  });

  PostsStates copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, List<PostModel>? tempPostList,  String? message, String? searchMessage}) {
    return PostsStates(
        postStatus: postStatus ?? this.postStatus,
        postList: postList ?? this.postList,
        tempPostList: tempPostList?? this.tempPostList,
        message: message ?? this.message,
        searchMessage:  searchMessage?? this.searchMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postStatus, postList, tempPostList, message, searchMessage];
}
