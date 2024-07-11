import 'package:flutter/material.dart';
import 'package:simple_event_management/components/buttons.dart';
import 'backend/shared_variables.dart';
import 'components/text_fields.dart';
import 'pages_backend/home.dart';

Map hackerData = {
  "id": "0",
  "name": "potato",
  "email": "potato@pomato.tomato",
  "phone": "01026000000",
  "nationalID": "p0tat0",
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double maxWidth = width * 0.9;
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                          flex: 2,
                        child: SignInTextField(
                          hintText: "Hacker ID",
                          controller: id,
                          onSubmitted: () => searchButton(
                            id: id.text,
                            context: context,
                            data: (data) {
                              data.remove("_id");
                              hackerData = data;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      Flexible(
                        child: CustomButton(
                          color: const Color.fromARGB(255, 39, 178, 243),
                          text: "Search",
                          pressFunction: () => searchButton(
                            id: id.text,
                            context: context,
                            data: (data) {
                              data.remove("_id");
                              hackerData = data;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    "Hacker Data",
                    style: TextStyle(fontSize: BigTextSize, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: width * 0.7),
                    child: Table(
                      border: TableBorder.all(
                        width: 2,
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      children: hackerDataTable(
                        hackerData,
                        context,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
