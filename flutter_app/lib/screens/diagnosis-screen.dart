import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plant_disease_detector/screens/solution_screen.dart';
import 'package:plant_disease_detector/widgets/custom-text-button.dart';

class DiagnosisScreen extends StatelessWidget {
  final String diseaseName, description, solution, vegetable;
  final bool isHealthy;
  final Image plantImage;

  const DiagnosisScreen({
    Key? key,
    required this.diseaseName,
    required this.description,
    required this.solution,
    required this.vegetable,
    required this.isHealthy,
    required this.plantImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff5C8A72),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.height / 4,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.lightGreen,
                      border: Border(
                        top: BorderSide(
                          color: isHealthy ? Colors.green : Colors.red,
                          width: 5.0,
                        ),
                        bottom: BorderSide(
                          color: isHealthy ? Colors.green : Colors.red,
                          width: 5.0,
                        ),
                        left: BorderSide(
                          color: isHealthy ? Colors.green : Colors.red,
                          width: 5.0,
                        ),
                        right: BorderSide(
                          color: isHealthy ? Colors.green : Colors.red,
                          width: 5.0,
                        ),
                      ),
                      image: DecorationImage(
                        image: plantImage.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Disease Name : $diseaseName',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Text(
                  'Disease Description:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 19.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                  child: Text(
                    'Vegetable : $vegetable',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                !isHealthy ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: CustomTextButton(
                    text: 'SOLUTION',
                    buttonBackgroundColor: Colors.white,
                    textColor: const Color(0xff20503B),
                    onPressedCallback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SolutionScreen(solutionText: solution,disease: diseaseName,),
                        ),
                      );
                    },
                  ),
                ) : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
