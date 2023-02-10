import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

// ignore: must_be_immutable
class CustomTable extends StatelessWidget {
  CustomTable(
      {Key? key,
      required this.headers,
      required this.source,
      required this.currentPage,
      required this.currentPerPage,
      required this.total,
      required this.fetch,
      this.onRowTapped,
      this.cardColor})
      : super(key: key);

  final List<DatatableHeader> headers;
  final List<Map<String, dynamic>> source;
  final int currentPage;
  final int currentPerPage;
  final int total;
  final void Function(int, int) fetch;
  final void Function(dynamic)? onRowTapped;
  Color? cardColor = Colors.grey[100];

  @override
  Widget build(BuildContext context) {
    var _currentPage = currentPage;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(0),
            // constraints: const BoxConstraints(
            //   maxHeight: 800,
            // ),
            child: Card(
              color: cardColor, //Colors.grey[100],
              elevation: 1,
              shadowColor: Colors.black,
              clipBehavior: Clip.none,
              child: ResponsiveDatatable(
                expanded: List.generate(currentPerPage, (index) => false),
                rowTextStyle: const TextStyle(
                    fontSize: 13, overflow: TextOverflow.ellipsis),
                selecteds: const [],
                selectedDecoration: const BoxDecoration(),
                headerDecoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 1.0))),
                rowDecoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromARGB(255, 155, 154, 154),
                            width: 0.5))),
                onTabRow: (value) {
                  onRowTapped!(value);
                },
                headers: headers,
                source: source,
                isExpandRows: false,
                footers: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Text("Rows per page:"),
                  ),
                  //if (_perPages.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton(
                        value: currentPerPage, //_currentPerPage,
                        items: [10, 15, 20, 50, 100] //_perPages
                            .map((e) => DropdownMenuItem(
                                  child: Text("$e"),
                                  value: e,
                                ))
                            .toList(),
                        onChanged: (dynamic value) {
                          fetch(1, value);
                        }),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                        "${_currentPage * currentPerPage - currentPerPage + 1} - ${currentPerPage * _currentPage} of $total"),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                    ),
                    onPressed: _currentPage == 1
                        ? null
                        : () {
                            final _nextSet = _currentPage - 1;
                            fetch(_nextSet, currentPerPage);
                          },
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 16),
                    onPressed: (_currentPage * currentPerPage) - 1 > total
                        ? null
                        : () {
                            var _nextSet = _currentPage + 1;
                            fetch(_nextSet, currentPerPage);
                          },
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
