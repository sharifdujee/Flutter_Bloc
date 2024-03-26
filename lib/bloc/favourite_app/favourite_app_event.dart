import 'package:bloc_basic/model/favourite_item_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteEvents extends Equatable{
  const FavouriteEvents();

  @override
  List<Object> get props => [];
}
class FetchFavouriteList extends FavouriteEvents{}

class FavouriteItem extends FavouriteEvents{
  final FavouriteItemModel item;
  const FavouriteItem({required this.item});
}

class SelectItem extends FavouriteEvents{
  final FavouriteItemModel item;
  const SelectItem ({required this.item});
}
class UnselectItem extends FavouriteEvents{
  final FavouriteItemModel item;
  const UnselectItem({required this.item});
}

class DeleteItem extends FavouriteEvents{

}
