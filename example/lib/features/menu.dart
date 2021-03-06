import 'package:flutter/material.dart';
import 'package:inno_plugin/pigeon/pigeon.dart';
import 'package:inno_plugin_example/features/ffi.dart';

import 'classic_plugin.dart';
import 'pigeon_plugin.dart';
import 'view_plugin.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Text(
                'Flutter Plugins',
                style: TextStyle(
                  fontSize: 40,
                  color: theme.colorScheme.secondary,
                ),
              ),
              const Spacer(),
              TextButton(
                child: const Text(
                  'Classic plugin',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ClasicPluginScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              TextButton(
                child: const Text(
                  'Pigeon plugin',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const PigeonPluginScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              TextButton(
                child: const Text(
                  'FFI example',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const FFIScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              TextButton(
                child: const Text(
                  'Native view plugin',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const ViewPluginPage(),
                    ),
                  );
                },
              ),
              const Spacer(),
              const Text('Yandex X Innopolis ?? 2022'),
              const SizedBox(height: 32)
            ],
          ),
        ),
      ),
    );
  }
}
