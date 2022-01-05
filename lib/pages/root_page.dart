import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scedu/model/page_data.dart';
import 'package:scedu/pages/calendar_page.dart';
import 'package:scedu/pages/goals_page.dart';
import 'package:scedu/pages/home_page.dart';
import 'package:scedu/pages/journal_page.dart';
import 'package:scedu/store/page_store.dart';
import 'package:scedu/widgets/nav_bar.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late PageStore pageStore;
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageStore = PageStore([
      PageData(
          label: "Übersicht",
          icon: CupertinoIcons.home,
          page: const HomePage()),
      PageData(
          label: "Kalender",
          icon: CupertinoIcons.calendar,
          page: const CalendarPage(),
          scrollable: false),
      PageData(
          label: "Ziele", icon: CupertinoIcons.rocket, page: const GoalsPage()),
      PageData(
          label: "Logbuch",
          icon: CupertinoIcons.book,
          page: const JournalPage())
    ], pageController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        children: pageStore.pages.map(
          (pageData) {
            final pageView = SafeArea(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              child: pageData.page,
            ));
            if (pageData.scrollable) {
              return SingleChildScrollView(child: pageView);
            }
            return pageView;
          },
        ).toList(),
        controller: pageController,
        onPageChanged: pageStore.setCurrentPage,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(2.0),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(CupertinoIcons.add),
          elevation: 2.0,
        ),
      ),
      extendBody: true,
      bottomNavigationBar: NavBar(pageStore),
    );
  }
}
