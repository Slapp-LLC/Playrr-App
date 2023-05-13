import 'package:flutter/material.dart';
import 'package:playrr_app/components/navigation_bar.dart';
import 'package:playrr_app/components/secondary_appbar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SecondaryAppBar(),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(color: Colors.black),
          child: const Text('Search')),
      bottomNavigationBar: CustomBottomNavigationBar(
          selectedIndex: _selectedIndex, context: context),
    );
  }
}
