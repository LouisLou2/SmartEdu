import 'package:flutter/material.dart';
import 'package:smart_edu/const/data_status.dart';
import '../../data/basic_data.dart';
import '../../datasource/imple/score_ds.dart';
import '../../entity/exam_score.dart';
import '../../entity/general/result.dart';
import '../../presentation/helper/toast_helper.dart';

class ScoreInquireProv with ChangeNotifier {

  bool selectedTerm = false;
  int selectedYear = 0;

  DataStatus _status = DataStatus.initial;
  DataStatus get status => _status;

  List<ExamScore> scores = [];

  init(){
    // basic data之后的
    selectedYear = BasicData.nowYear;
    selectedTerm = BasicData.nowTermPart;
  }

  void setYearTerm(int year, bool term){
    selectedYear = year;
    selectedTerm = term;
  }

  void setScores(List<ExamScore> scores){
    this.scores = scores;
    notifyListeners();
  }

  void setStatus(DataStatus status){
    _status = status;
    notifyListeners();
  }

  String get timeStrKey => status==DataStatus.initial?'':'$selectedYear:${selectedTerm?'1':'2'}';

  Future<void> fetchScores() async {
    setStatus(DataStatus.loading);
    Result<List<ExamScore>> res= await StudentScoresDs.getStudentScores(selectedYear, selectedTerm,);
    if(res.isSuccess){
      scores = res.data!;
      setStatus(DataStatus.success);
    }else{
      ToastHelper.showErrorWithouDesc('${res.resCode}');
      setStatus(DataStatus.failure);
    }
  }
}