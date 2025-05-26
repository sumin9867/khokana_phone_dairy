
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:local_telephone_dairy/core/presentation/scaffold_with_bottom_navbar.dart';
// import 'package:local_telephone_dairy/features/auth/application/login_cubit/login_state.dart';
// import 'package:local_telephone_dairy/features/auth/application/sign_up/auth_cubit.dart';
// import 'package:local_telephone_dairy/features/auth/application/sign_up/auth_state.dart';
// import 'package:local_telephone_dairy/features/auth/presentation/login/sign_in_form.dart';
// import 'package:local_telephone_dairy/features/auth/presentation/sign_up/sign_up_form.dart';
// import 'package:local_telephone_dairy/features/contact/presentation/add_contact_screen.dart';
// import 'package:local_telephone_dairy/features/contact/presentation/contact_screen.dart';
// import 'package:local_telephone_dairy/features/profile/presentation/profile_screen.dart';

// final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
// final GlobalKey<NavigatorState> _shellRouteKey = GlobalKey<NavigatorState>();

// class AppRoutes {
//   static const String signIn = '/signIn';
//   static const String signUp = '/signUp'; 
//   static const String profile = '/profile';
//   static const String contact = '/contact';
//   static const String addContact = '/add_contact';


// }

// class AppRouter {
//   final AuthCubit authCubit;
//   GoRouter get router => _router;

//   AppRouter({required this.authCubit});

//   late final GoRouter _router = GoRouter(
//     debugLogDiagnostics: true,
//     navigatorKey: _rootNavigatorKey,
//     initialLocation: AppRoutes.signIn,    refreshListenable: GoRouterRefreshStream(authCubit.stream),  
//     routes: [
//       GoRoute(
//         path: AppRoutes.signIn,
//         name: SignInForm.routeName,
//         builder: (context, state) => const SignInForm(),
//       ),
//       GoRoute(
//         path: AppRoutes.signUp,
//         name: SignUpForm.routeName,
//         builder: (context, state) => const SignUpForm(),
//       ),
//       ShellRoute(
//         navigatorKey: _shellRouteKey,
//         builder: (context, state, child) {
//           return ScaffoldWithBottomNavbar(child: child);
//         },
//         routes: [
//           GoRoute(
//             path: AppRoutes.contact,
//             name: ContactScreen.routeName,
//             builder: (context, state) => const ContactScreen(),
//           ),
//           GoRoute(
//             path: AppRoutes.addContact,
//             name: AddContactScreen.routeName,
//             builder: (context, state) => const AddContactScreen(),
//           ),
//           GoRoute(
//             path: AppRoutes.profile,
//             name: ProfileScreen.routeName,
//             builder: (context, state) => const ProfileScreen(),
//           ),
//         ],
//       ),
//     ],

//     redirect: (context, state) {
      


//       AuthState authState = authCubit.state;

//       if (authState ==  AuthInitial) {
//         return null;
//       }

//       if (authState ==  AuthLoading()) {
//         return null;
//       }

//       final bool isAuthenticated = authState == AuthAuthenticated(userModel: );

//       if (!isAuthenticated) {
//         if (_unProtectedRoutes.contains(location)) {
//           return null;
//         }
//         return AppRoutes.login;
//       }

//       if ((location == AppRoutes.login && isAuthenticated) ||
//           (location == AppRoutes.splash && isAuthenticated)) {
//         return AppRoutes.calendar;
//       }

//       return null;
//     },
//   );
// }
// class GoRouterRefreshStream extends ChangeNotifier {
//   GoRouterRefreshStream(Stream<dynamic> stream) {
//     notifyListeners();
//     _subscription = stream.asBroadcastStream().listen(
//           (dynamic _) => notifyListeners(),
//         );
//   }

//   late final StreamSubscription<dynamic> _subscription;

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
// }
