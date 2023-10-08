import 'package:books_app/feature/Book%20Details/screen/book_details.dart';
import 'package:books_app/feature/category/screens/category_screen.dart';
import 'package:books_app/feature/contact%20us/screen/contact_screen.dart';
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
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreeen());
      case RoutesName.boardingScreen:
        return MaterialPageRoute(builder: (_) => const OnbordingScreen());
      case RoutesName.ottp:
        return MaterialPageRoute(builder: (_) => const OttpScreen());
      case RoutesName.bookDetails:
        Book book = settings.arguments as Book;
        return MaterialPageRoute(
          builder: (_) => BookDetailsScreen(book: book),
        );
      case RoutesName.homelayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case RoutesName.updatePassword:
        return MaterialPageRoute(builder: (_) => const UpdatePasswordScreen());
      case RoutesName.userProfile:
        return MaterialPageRoute(builder: (_) => const UserProfileScreen());
      case RoutesName.sendOrder:
        return MaterialPageRoute(builder: (_) => const OrderScreen());
      case RoutesName.contactUs:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());
      case RoutesName.orderHistory:
        return MaterialPageRoute(builder: (_) => const OrderHistoryScreen());
      case RoutesName.category:
        Category category = settings.arguments as Category;
        return MaterialPageRoute(
            builder: (_) => CategoryScreen(category: category));
    }

    return null;
  }
}
