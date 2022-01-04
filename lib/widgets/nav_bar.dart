import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scedu/store/page_store.dart';
import 'package:scedu/util/indexed_iterable.dart';

class NavBar extends StatelessWidget {
  final PageStore pageStore;
  final double fabSize;

  const NavBar(this.pageStore, {Key? key, this.fabSize = 12.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).bottomNavigationBarTheme;

    final items = pageStore.pages
        .mapIndexed<Widget>((page, i) => Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => pageStore.setCurrentPage(i),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Observer(builder: (_) {
                    return Icon(
                      page.icon,
                      size: 32,
                      color: i == pageStore.currentPageIndex
                          ? theme.selectedItemColor
                          : theme.unselectedItemColor,
                    );
                  }),
                ),
              ),
            ))
        .toList();
    items.insert(pageStore.pages.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround, children: items),
    );
  }

  Widget _buildMiddleTabItem() {
    return SizedBox(height: 0, width: fabSize);
  }
}
