import 'package:flutter/material.dart';
import 'package:local_telephone_dairy/core/theme/app_color.dart';


class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ProfileItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Icon(icon, size: 24, color: AppColor.ctaBlue),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColor.ctaBlue),
            ),
          ),
        ],
      ),
    );
  }
}
