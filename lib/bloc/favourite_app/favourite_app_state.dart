import 'package:equatable/equatable.dart';
import 'package:bloc_basic/model/favourite_item_model.dart';

enum ListStatus { loading, success, failure }

class FavouriteItemState extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> temFavouriteList;
  final ListStatus listStatus;
  const FavouriteItemState(
      {this.favouriteItemList = const [],
        this.temFavouriteList = const [],
      this.listStatus = ListStatus.loading});
  FavouriteItemState copyWith(
      {List<FavouriteItemModel>? favouriteItemList, List<FavouriteItemModel>? temFavouriteList,  ListStatus? listStatus}) {
    return FavouriteItemState(
        favouriteItemList: favouriteItemList ?? this.favouriteItemList,
        temFavouriteList: temFavouriteList?? this.temFavouriteList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [favouriteItemList, temFavouriteList, listStatus];
}
