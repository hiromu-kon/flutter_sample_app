import 'package:flutter/material.dart';
import 'package:flutter_sample_app/utils/utils.dart';
import 'package:flutter_sample_app/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const ProfilePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: 'ProfilePage',
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            _headerSectionWidget(),
            _tabSectionWidget(),
          ],
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      index.toString(),
                      style: const TextStyle(
                        fontSize: 100,
                        color: ColorName.primary,
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      index.toString(),
                      style: const TextStyle(
                        fontSize: 100,
                        color: ColorName.primary,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerSectionWidget() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            color: Colors.black,
            height: 200,
            child: const Center(
              child: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabSectionWidget() {
    return const SliverPersistentHeader(
      pinned: true,
      delegate: _StickyTabBarDelegate(
        tabBar: TabBar(
          labelColor: ColorName.primary,
          tabs: [
            Tab(
              text: '1',
            ),
            Tab(
              text: '2',
            )
          ],
        ),
      ),
    );
  }
}

//SliverPersistentHeaderDelegateを継承したTabBarを作る
class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const _StickyTabBarDelegate({required this.tabBar});

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
