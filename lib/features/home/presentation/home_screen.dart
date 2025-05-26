import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:local_telephone_dairy/core/presentation/animation/app_animated_switcher.dart';
import 'package:local_telephone_dairy/core/presentation/app_router.dart';
import 'package:local_telephone_dairy/core/presentation/appbar/local_phone_app_bar.dart';
import 'package:local_telephone_dairy/core/responsive_size.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';
import 'package:local_telephone_dairy/features/catagories/presentation/contact_catogories.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_cubit.dart';
import 'package:local_telephone_dairy/features/contact/application/cubit/contact_state.dart';
import 'package:nepali_utils/nepali_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ContactCubit, ContactState>(
        builder: (context, state) {
          switch (state.status) {
            case ContactStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ContactStatus.success:
              return _buildSuccessState(context, state);
            case ContactStatus.error:
              return Center(
                child: Text(state.errorMessage ?? "Unexpected Error Occurred"),
              );
            default:
              return const Center(
                  child: Text("Unexpected Error Occurred, Try Again"));
          }
        },
      ),
    );
  }

  Scaffold _buildSuccessState(BuildContext context, ContactState state) {
    final NepaliDateTime nepaliDate = NepaliDateTime.now();

    final String formattedDate = NepaliDateFormat.MMMMd().format(nepaliDate);
    return Scaffold(
    appBar: AppBar(
  centerTitle: true,
  actions: const [
    Padding(
      padding: EdgeInsets.only(right: 12),
      child: CircleAvatar(
        child: Icon(IconsaxPlusLinear.search_normal_1),
      ),
    ),
  ],
  leading: const Padding(
    padding: EdgeInsets.only(left: 12),
    child: CircleAvatar(
      child: Icon(IconsaxPlusLinear.profile),
    ),
  ),
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text(
        "Hello, Sumin",
        style: TextStyle(
          fontSize: 18,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 9,),
      Text(
        "Today, $formattedDate",
        style: const TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 41, 41, 41),
          fontWeight: FontWeight.w100,
        ),
      ),
    ],
  ),
),

      floatingActionButton: FloatingActionButton.extended(
        key: const Key('add_contact_fab'),
        backgroundColor: AppColor.primaryColor,
        onPressed: () => context.push(AppRoutes.addContact),
        label: const Text(
          "Add Contact",
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          IconsaxPlusLinear.add_circle,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      body: AppAnimatedSwitcher(
        child: CustomScrollView(
          slivers: [
            _buildGreeting("Hello,", context, isSubText: true),
            _buildGreeting("Sumin", context),
          ],
        ),
      ),
    );
  }

  Widget _buildGreeting(String text, BuildContext context,
      {bool isSubText = false}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 4.0, horizontal: ScreenUtils.getWidth(context, .02)),
        child: Text(
          text,
          style: TextStyle(
            fontSize: isSubText ? 18 : 28,
            fontWeight: isSubText ? FontWeight.w500 : FontWeight.bold,
            color: isSubText ? Colors.grey[700] : Colors.black,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
