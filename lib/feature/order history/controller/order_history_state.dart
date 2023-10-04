abstract class OrderHistoryState {}

class OrderHistoryInitial extends OrderHistoryState {}

class LoadingHistoryOrders extends OrderHistoryState {}

class SucessLoadingHistory extends OrderHistoryState {}

class FaildLoadHistory extends OrderHistoryState {}
