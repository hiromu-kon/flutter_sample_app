import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 参考動画： Flutter Tutorial - App Bar Design UI & Transparent App Bar [2021]
/// https://www.youtube.com/watch?v=BAshFKJptFg&t=0s
class TransparentAppBarPage extends HookConsumerWidget {
  const TransparentAppBarPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const TransparentAppBarPage(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar'),
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
          elevation: 20,
          flexibleSpace: const DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1534270804882-6b5048b1c1fc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8JUU2JTk2JUIwJUU3JTlEJTgwfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5,
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.list_alt),
                text: 'Feed',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Profile',
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
