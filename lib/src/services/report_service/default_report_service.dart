import 'package:excel/excel.dart';
import 'package:the_util/src/services/report_service/report_service.dart';

class DefaultReportService implements ReportService {
  List<String> headers = [];

  Future<List<List<String>>> allData(List<dynamic> items) async {
    headers = await extractHeader(items[0]);
    return items.map((e) => fieldsFrom(e)).toList();
  }

  List<String> fieldsFrom(dynamic item) {
    final _json = item.toJson();
    List<String> row = [];
    _json.forEach((key, value) {
      row.add(value.toString());
    });
    return row;
  }

  Future<List<String>> extractHeader(dynamic headerItem) async {
    final _json = headerItem.toJson();
    List<String> _headers = [];
    _json.forEach((key, value) {
      _headers.add(key.toString());
    });
    return _headers;
  }

  @override
  void export({
    required String sheetName,
    required List<dynamic> rows,
  }) async {
    // when you are in flutter web then save() downloads the excel file.
    var excel =
        Excel.createExcel(); // automatically creates 1 empty sheet: Sheet1
    Sheet sheetObject = excel[sheetName];
    excel.delete('Sheet1'); //delete dafault sheet
    final rowItems = await allData(rows);

    var i = 0;
    sheetObject.insertRowIterables(headers, i++);

    for (var row in rowItems) {
      sheetObject.insertRowIterables(row, i++);
    }

    // Call function save() to download the file
    excel.save(fileName: '$sheetName.xlsx');
  }
}
