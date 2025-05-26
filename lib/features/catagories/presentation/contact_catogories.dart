import 'package:flutter/material.dart';
import 'package:local_telephone_dairy/features/contact/presentation/widgets/contact_list.dart';

class ContactCategories extends StatefulWidget {
  ContactCategories({super.key});

  @override
  _ContactCategoriesState createState() => _ContactCategoriesState();
}

class _ContactCategoriesState extends State<ContactCategories> {
  final List<String> addresses = [
    "Nhyabu",
    "Gabu",
    "Taile",
    "Nanchya",
    "Thalxi",
    "Thokasi",
    "Kutupukhu",
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: addresses.length,
          itemBuilder: (context, index) => _buildCategoryItem(index),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(int index) {
    final isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () => _onCategoryTap(index),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: isSelected ? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: Center(
            child: Text(
              addresses[index],
              maxLines: 1,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onCategoryTap(int index) {
    setState(() => selectedIndex = index);
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => ContactList(address: addresses[index]),
    //   ),
    // );
  }
}
