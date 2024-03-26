
import 'package:bloc_basic/bloc/favourite_app/favourite_app_event.dart';
import 'package:bloc_basic/bloc/favourite_app/favourite_app_state.dart';
import 'package:bloc_basic/model/favourite_item_model.dart';
import 'package:bloc_basic/repository/favourite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteBloc extends Bloc<FavouriteEvents, FavouriteItemState> {
  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> temFavouriteList = [];
  FavouriteRepository favouriteRepository;

  FavouriteBloc(this.favouriteRepository) : super(const FavouriteItemState()) {
    on<FetchFavouriteList>(fetchList);
    on<FavouriteItem>(_addFavouriteItem);
    on<SelectItem>(_selectItem);
    on<UnselectItem>(_unSelectItem);
    on<DeleteItem>(_deleteItem);
  }

  void fetchList(FetchFavouriteList event,
      Emitter<FavouriteItemState> emitter) async {
    favouriteList = await favouriteRepository.fetchItem();
    emitter(state.copyWith(favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success));
  }

  void _addFavouriteItem(FavouriteItem event,
      Emitter<FavouriteItemState> emitter) async {
    final index =  favouriteList.indexWhere((element) =>
    element.id == event.item.id);
    if(event.item.isFavourite){
      if(temFavouriteList.contains(favouriteList[index])){
        temFavouriteList.remove(favouriteList[index]);
        temFavouriteList.add(event.item);
        
      }
      
    }
    else{
      if(temFavouriteList.contains(favouriteList[index])){
        temFavouriteList.remove(favouriteList[index]);
        temFavouriteList.add(event.item);

      }
      
    }
    favouriteList[index] = event.item;
    emitter(state.copyWith(favouriteItemList: List.from(favouriteList), temFavouriteList: List.from(temFavouriteList)));
  }

  void _selectItem(SelectItem event,
      Emitter<FavouriteItemState> emitter)  {
    temFavouriteList.add(event.item);

    emitter(state.copyWith(temFavouriteList: List.from(temFavouriteList)));
  }

  void _unSelectItem(UnselectItem event,
      Emitter<FavouriteItemState> emitter)  {
    temFavouriteList.remove(event.item);

    emitter(state.copyWith(temFavouriteList: List.from(temFavouriteList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteItemState> emitter)  {
    for(int i = 0; i<temFavouriteList.length; i++){
      favouriteList.remove(temFavouriteList[i]);
    }
    temFavouriteList.clear();
    emitter(state.copyWith(
      favouriteItemList: List.from(favouriteList),
        temFavouriteList: List.from(temFavouriteList)));
  }
}