import 'package:bloc_basic/bloc/posts/posts_bloc.dart';
import 'package:bloc_basic/bloc/posts/posts_event.dart';
import 'package:bloc_basic/bloc/posts/posts_state.dart';
import 'package:bloc_basic/utils/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Posts Apis',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: BlocBuilder<PostBloc, PostsStates>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const CircularProgressIndicator();
            case PostStatus.failure:
              return Center(child: Text(state.message.toString()));
            case PostStatus.success:
              return ListView.builder(
                  itemCount: state.postList.length,
                  itemBuilder: (context, index) {
                    final item = state.postList[index];
                    return ListTile(
                      leading: Text('ID is ${item.id.toString()}'),
                      title: Row(
                        children: [
                          Expanded(child: Text('name is ${item.name.toString()}')),
                          Expanded(child: Text('Email is ${item.email.toString()}')),
                        ],
                      ),
                      subtitle: Text(item.body.toString()),
                    );
                  });
          }
        },
      ),
    );
  }
}
