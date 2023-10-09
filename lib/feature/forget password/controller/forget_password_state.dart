abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class LoadingForgetPassword extends ForgetPasswordState {}

class SucessSendingCode extends ForgetPasswordState {}

class FailedToSendCode extends ForgetPasswordState {}
