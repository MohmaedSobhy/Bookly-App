abstract class WishListState {}

class WishListInitial extends WishListState {}

class LoadWishList extends WishListState {}

class SucceedLoadWishList extends WishListState {}

class FailedLoadWishList extends WishListState {}

class SuccefullyRemoveFromWishList extends WishListState {}

class FailedRemoveFromWishList extends WishListState {}
