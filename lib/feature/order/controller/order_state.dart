abstract class OrderState {}

class OrderInitial extends OrderState {}

class LoadingData extends OrderState {}

class SussessLoadData extends OrderState {}

class FailedtoSendOrder extends OrderState {}

class SucessSendOrder extends OrderState {}
