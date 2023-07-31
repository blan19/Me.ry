import 'package:diary/data/repository/diary_repository_impl.dart';
import 'package:diary/domain/repository/diary_repository.dart';
import 'package:diary/foundation/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final addDiaryViewModelProvider =
    ChangeNotifierProvider((ref) => AddDiaryViewModel(ref.read));

class AddDiaryViewModel extends ChangeNotifier {
  final dynamic _reader;

  AddDiaryViewModel(this._reader);

  late final DiaryRepository _diaryRepository =
      _reader(diaryRepositoryProvider);

  int _year = AppDateUtils.createDiaryYear().last;
  int _month = AppDateUtils.createDiaryMonth(DateTime.now().year).last;
  int _day =
      AppDateUtils.createDiaryDay(DateTime.now().year, DateTime.now().month)
          .last;

  int get year => _year;
  int get month => _month;
  int get day => _day;

  void updateDate({
    required int year,
    required int month,
    required int day,
  }) {
    _year = year;
    _month = month;
    _day = day;
    notifyListeners();
  }
}