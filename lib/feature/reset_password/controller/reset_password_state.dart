abstract class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

class FailedToResetPassword extends ResetPasswordState {}

class SucessfullyResetPassword extends ResetPasswordState {}

class LoadingResetPassword extends ResetPasswordState {}
