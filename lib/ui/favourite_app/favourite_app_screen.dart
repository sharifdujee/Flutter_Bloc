import 'package:bloc_basic/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_basic/bloc/favourite_app/favourite_app_event.dart';
import 'package:bloc_basic/bloc/favourite_app/favourite_app_state.dart';
import 'package:bloc_basic/model/favourite_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Favourite App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteItemState>(
            builder: (context, state){
              return Visibility(
                visible: state.temFavouriteList.isNotEmpty? true: false,
                child: IconButton(onPressed: (){
                  context.read<FavouriteBloc>().add(DeleteItem());
                }, icon: const Icon(Icons.delete), color: Colors.red,),
              );
            },
              )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<FavouriteBloc, FavouriteItemState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case ListStatus.failure:
                return const Text('Something went wrong');
              case ListStatus.success:
                return ListView.builder(
                    itemCount: state.favouriteItemList.length,
                    itemBuilder: (context, index) {
                      final item = state.favouriteItemList[index];
                      return Card(
                        child: ListTile(
                          leading: Checkbox(value: state.temFavouriteList.contains(item)? true: false, onChanged: (value){
                            if(value!){
                              context.read<FavouriteBloc>().add(SelectItem(item: item));

                            }
                            else{
                              context.read<FavouriteBloc>().add(UnselectItem(item: item));

                            }

                          }),
                          title: Text(item.value.toString()),
                          trailing: IconButton(onPressed: (){
                            FavouriteItemModel itemModel =  FavouriteItemModel(
                                id: item.id, value: item.value,
                                isFavourite: item.isFavourite? false: true
                            );
                            context.read<FavouriteBloc>().add(FavouriteItem(item: itemModel));
                          }, icon: Icon(item.isFavourite ? Icons.favorite : Icons.favorite_outline)),
                        ),
                      );
                    });
              // TODO: Handle this case.
            }
          },
        ),
      ),
    );
  }
}
