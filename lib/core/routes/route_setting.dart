import 'package:books_app/feature/book_details/screen/book_details.dart';
import 'package:books_app/feature/category/screens/category_screen.dart';
import 'package:books_app/feature/contact_us/screen/contact_screen.dart';
import 'package:books_app/feature/forget%20password/screens/forget_password_screen.dart';
import 'package:books_app/feature/layout/screens/home_layout.dart';
import 'package:books_app/feature/order%20history/screens/order_history.dart';
import 'package:books_app/feature/order/screens/order_screen.dart';
import 'package:books_app/feature/splash/screen/splash_screen.dart';
import 'package:books_app/feature/update_password/screens/update_password.dart';
import 'package:books_app/feature/user%20profile/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import '../../feature/login/screen/login_screen.dart';
import '../../feature/on_boarding/screen/onbording.dart';
import '../../feature/ottp/screen/ottp_screen.dart';
import '../../feature/sign%20up/screen/sign_up_screen.dart';
import '../model/book.dart';
import '../model/category_model.dart';
import 'route_name.dart';

class AppRouting {
  static Route? genertateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.spalsh:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SplashScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case RoutesName.login:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case RoutesName.signUp:
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SignUpScreeen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case RoutesName.boardingScreen:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const OnbordingScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case RoutesName.ottp:
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => OttpScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case RoutesName.bookDetails:
        Book book = settings.arguments as Book;
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => BookDetailsScreen(
            book: book,
          ),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case RoutesName.homelayout:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomeLayout(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case RoutesName.updatePassword:
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const UpdatePasswordScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case RoutesName.userProfile:
        return MaterialPageRoute(builder: (_) => const UserProfileScreen());
      case RoutesName.sendOrder:
        return MaterialPageRoute(builder: (_) => const OrderScreen());
      case RoutesName.contactUs:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const ContactUsScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case RoutesName.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPassWordScreen());
      case RoutesName.orderHistory:
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const OrderHistoryScreen(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
      case RoutesName.category:
        Category category = settings.arguments as Category;
        return MaterialPageRoute(
          builder: (_) => CategoryScreen(category: category),
        );
    }

    return null;
  }
}
