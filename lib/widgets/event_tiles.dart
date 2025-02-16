import 'package:flutter/material.dart';

class ProfileTabs extends StatefulWidget {
  // final List<Widget> posts;
  // final List<Widget> comments;
  // final Widget stats;
  final List<String> tabTitles;
  final List<Widget> tabContents;

  const ProfileTabs({
    super.key,
    // required this.posts,
    // required this.comments,
    // required this.stats,
    required this.tabTitles,
    required this.tabContents,
  });

  @override
  ProfileTabsState createState() => ProfileTabsState();
}

class ProfileTabsState extends State<ProfileTabs> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController();
  }

  void _onTabChanged(int index) {
    _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void _onPageChanged(int index) {
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TabBar
        TabBar(
          controller: _tabController,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.black54,
          indicatorColor: Colors.red,
          tabs: widget.tabTitles.map((title) => Tab(text: title)).toList(),
          onTap: _onTabChanged,
        ),

        // PageView for switching tabs
        Expanded(
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: widget.tabContents,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
