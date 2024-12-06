import 'package:flutter/material.dart';

class QutionScreen extends StatefulWidget {
  const QutionScreen({super.key});

  @override
  State<QutionScreen> createState() => _QutionScreenState();
}

class _QutionScreenState extends State<QutionScreen> {
  final TextEditingController _commonHealthComplaintsController =
      TextEditingController();
  final TextEditingController _familyHistoryController =
      TextEditingController();
  final TextEditingController _personalHistoryController =
      TextEditingController();
  final TextEditingController _dailyRoutineController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 46.0, vertical: 20),
                child: SizedBox(
                  height: height * 0.10,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      'Enter Personal Details',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 56),
                child: TextFormField(
                  controller: _commonHealthComplaintsController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Common Health Complaints',
                    labelStyle: TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 56, top: 82),
                child: TextFormField(
                  controller: _familyHistoryController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Family History',
                    labelStyle: TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 56, top: 82),
                child: TextFormField(
                  controller: _personalHistoryController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Personal History',
                    labelStyle: TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 56, top: 82),
                child: TextFormField(
                  controller: _dailyRoutineController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Daily Routine',
                    labelStyle: TextStyle(
                      color: Colors.amber,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 150, bottom: 130),
              //   child: CustomButton(
              //     text: 'Submit',
              //     onpressed: ,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
