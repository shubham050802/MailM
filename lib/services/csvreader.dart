import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

class Reader {
  Reader();
  List<List<dynamic>> listdata = [];

  Future loadCSV() async {
    final _rawdata = await rootBundle.loadString('assets/Mail_copy.csv');
    listdata = const CsvToListConverter().convert(_rawdata);
    sort();
    return listdata;
  }

  void sort() {
    final int colIndex = 3;
    final List<dynamic> header = listdata.removeAt(0);
    listdata.sort((a, b) => a[colIndex].compareTo(b[colIndex]));
    listdata.insert(0, header);
  }
}
