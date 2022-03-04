import 'package:aprilskuisine/home/pages/searchscreen.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search any food",
            suffixIcon: Material(
              elevation: 3.0,
              borderRadius: BorderRadius.circular(30.0),
              child: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchScreen()));
          },
        ),
      ),
    );
  }
}
