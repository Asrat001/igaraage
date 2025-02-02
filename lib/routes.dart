import 'package:flutter/material.dart';
import 'package:garaage/presentation/add_car_info/pages/add_car_info.dart';
import 'package:garaage/presentation/performance_analytics/pages/ar_identify.dart';
import 'presentation/auth/pages/register.dart';
import 'presentation/auth/pages/sign_in.dart';
import 'presentation/chatbot/pages/chatbot.dart';
import 'presentation/connect/pages/connect.dart';
import 'presentation/navigation/pages/navigation.dart';
import 'presentation/onboarding/pages/onboarding.dart';
import 'presentation/profile/pages/profile.dart';

final Map<String, WidgetBuilder> routes = {
  OnboardingPage.routeName: (context) => const OnboardingPage(),
  SignInPage.routeName: (context) => SignInPage(),
  RegisterPage.routeName: (context) => RegisterPage(),
  ConnectPage.routeName: (context) => const ConnectPage(),
  AddCarInfo.routeName:(context)=> AddCarInfo(),
  NavigationPage.routeName: (context) => const NavigationPage(),
  ProfilePage.routeName: (context) => const ProfilePage(),
  PerformanceAnalyticsPage.routeName: (context) => const PerformanceAnalyticsPage(),
  ChatbotPage.routeName: (context) => const ChatbotPage(),
};
