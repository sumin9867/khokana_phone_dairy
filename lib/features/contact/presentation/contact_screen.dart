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

class ContactScreen extends StatelessWidget {

  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
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
    );
  }

  Scaffold _buildSuccessState(BuildContext context, ContactState state) {
    return Scaffold(
      appBar: LocalPhoneAppBar(
        title: "",
        contact: state.contacts,
      ),
      floatingActionButton: FloatingActionButton.extended(
        key: const Key('add_contact_fab'),
        backgroundColor: AppColor.primaryColor,
        onPressed: () => context.push(AppRoutes.addContact),
        label: const Text(
          "Add Contact",
          style: TextStyle(color: Colors.white), // white text
        ),
        icon: const Icon(
          IconsaxPlusLinear.add_circle,
          color: Colors.white, // white icon
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // more rounded corners
        ),
      ),
      body: AppAnimatedSwitcher(
        child: CustomScrollView(
          slivers: [
            _buildGreeting("Hello,", context, isSubText: true),
            _buildGreeting("Sumin", context),
            ContactCategories(),
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
            fontSize: isSubText ? 18 : 28, // Larger for "Sumin"
            fontWeight: isSubText ? FontWeight.w500 : FontWeight.bold,
            color: isSubText ? Colors.grey[700] : Colors.black,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
