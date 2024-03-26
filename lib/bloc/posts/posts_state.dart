import 'package:bloc_basic/model/posts_model.dart';
import 'package:bloc_basic/utils/enums.dart';
import 'package:equatable/equatable.dart';

class PostsStates extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final String message;

  const PostsStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.message = '',
  });

  PostsStates copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return PostsStates(
        postStatus: postStatus ?? this.postStatus,
        postList: postList ?? this.postList,
        message: message ?? this.message);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [postStatus, postList];
}
