import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';
import 'package:local_telephone_dairy/features/contact/presentation/add_contact_screen.dart';
import 'package:local_telephone_dairy/features/contact/presentation/contact_screen.dart';
import 'package:local_telephone_dairy/features/updates/presentation/news_screen.dart';
import 'package:local_telephone_dairy/features/profile/presentation/profile_screen.dart';

class ScaffoldWithBottomNavbar extends StatefulWidget {
  const ScaffoldWithBottomNavbar({super.key, required this.child});

  final Widget child;

  @override
  State<ScaffoldWithBottomNavbar> createState() =>
      _ScaffoldWithBottomNavbarState();
}

class _ScaffoldWithBottomNavbarState extends State<ScaffoldWithBottomNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const ContactScreen(),
    const AddContactScreen(),
    const NewsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 18,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: AppColor.error,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: IconsaxPlusLinear.mobile,
                  text: "Contact",
                ),
                GButton(
                  icon: IconsaxPlusLinear.add_circle,
                  text: "Add",
                ),
                GButton(
                  icon: IconsaxPlusLinear.information,
                  text: "Updates",
                ),
                GButton(
                  icon: IconsaxPlusLinear.profile,
                  text: "Profile",
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) => setState(() {
                _selectedIndex = index;
              }),
            ),
          ),
        ),
      ),
    );
  }
}
