import 'package:books_app/core/localization/app_string.dart';
import 'package:books_app/core/theme/app_color.dart';
import 'package:books_app/feature/reset_password/controller/reset_password_cubit.dart';
import 'package:books_app/feature/reset_password/views/input_failed_reset_password.dart';
import 'package:books_app/feature/reset_password/views/sucefully_reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/reset_password_state.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String code;
  const ResetPasswordScreen({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ResetPasswordCubit.getInstanse(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            AppString.resetPassword,
            style: TextStyle(
              color: AppColor.darkBlue,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
          builder: (context, state) {
            ResetPasswordCubit.getInstanse().code = code;
            if (state is SucessfullyResetPassword) {
              return const SucefullyResetPasswordView();
            }
            return const InputFailedResetPassword();
          },
        ),
      ),
    );
  }
}
