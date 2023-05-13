import 'package:flutter/material.dart';
import 'package:playrr_app/components/secondary_appbar.dart';
import 'package:playrr_app/screens/settings/components/settings.body.dart';

class ConfigScreen extends StatefulWidget {
  const ConfigScreen({super.key});

  @override
  State<ConfigScreen> createState() => _ConfigScreenState();
}

class _ConfigScreenState extends State<ConfigScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      appBar: SecondaryAppBar(
        title: 'Configuraciones',
      ),
      body: SettingsBody(),
    );
  }
}
