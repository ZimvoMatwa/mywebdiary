import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? _dropDownText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        toolbarHeight: 100,
        elevation: 4,
        title: Row(
          children: [
            Text(
              'my',
              style: TextStyle(fontSize: 39, color: Colors.blueGrey.shade400),
            ),
            const Text(
              'Diary',
              style: TextStyle(fontSize: 39, color: Colors.green),
            )
          ],
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                    items: <String>['Latest', 'Earliest'].map((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.grey),
                          ));
                    }).toList(),
                    hint: Text(_dropDownText ?? 'Sort'),
                    onChanged: (value) {
                      switch (value) {
                        case 'Latest':
                          setState(() => _dropDownText = value);
                          break;
                        case 'Earliest':
                          setState(() => _dropDownText = value);
                          break;
                        default:
                          setState(() => _dropDownText = 'Latest');
                      }
                    }),
              ),
              //TODO: create profile
              Container(
                child: Row(
                  children: [
                    Column(
                      children: const [
                        Expanded(
                          child: InkWell(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://picsum.photos/id/237/200/300'),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'frankie',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.logout_rounded,
                        size: 19,
                        color: Colors.redAccent,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border(
                    right: BorderSide(width: 0.4, color: Colors.blueGrey),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SfDateRangePicker(
                        onSelectionChanged: (dateSelection) {}),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Column(),
            ),
          ),
        ],
      ),
    );
  }
}
