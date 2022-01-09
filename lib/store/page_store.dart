import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:scedu/model/page_data.dart';
import 'package:scedu/util/date.dart';

part 'page_store.g.dart';

class PageStore = _PageStore with _$PageStore;

abstract class _PageStore with Store {
  @observable
  List<PageData> pages;

  @observable
  PageController controller;

  @observable
  int currentPageIndex = 0;

  @observable
  DateTime selectedDate = DateTime.now().toDate();

  @observable
  DateTime selectedMonth = DateTime.now().toMonth();

  _PageStore(this.pages, this.controller);

  @computed
  PageData get currentPage => pages[currentPageIndex];

  @action
  void setCurrentPage(int i) {
    currentPageIndex = i;
    controller.jumpToPage(i);
  }
}
