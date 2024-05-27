import 'package:flutter/material.dart';
import 'package:flutter_roadmap/age_calculator/advice_screen.dart';
import 'package:intl/intl.dart';

class AgeCalculationScreen extends StatefulWidget {
  const AgeCalculationScreen({super.key});

  @override
  State<AgeCalculationScreen> createState() => _AgeCalculationScreenState();
}

class _AgeCalculationScreenState extends State<AgeCalculationScreen> {
  final dateOfBirthController = TextEditingController();
  final selectedDateController = TextEditingController();
  bool isSelectedDateVisible = false;
  String ageText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate your age'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _dateOfBirth(),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Semantics(
            child: Row(
              children: [
                Checkbox(
                  value: isSelectedDateVisible,
                  onChanged: (bool? value) {
                    setState(() {
                      isSelectedDateVisible = value ?? false;
                      ageText = isSelectedDateVisible
                          ? getSelectedFormattedAge(dateOfBirthController.text,
                              selectedDateController.text)
                          : getFormattedAge(dateOfBirthController.text);
                    });
                  },
                ),
                Text('Calculate spefific age')
              ],
            ),
          ),
          if (isSelectedDateVisible) _selectedDate(),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(5.00),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Age: $ageText',
              style: const TextStyle(fontSize: 15),
            ),
          ),

          /*   ElevatedButton(onPressed: (){
           _displayAgeRange();
         }, child: Text('dispaly'))*/
        ],
      ),
    );
  }

  Object _displayAgeRange() {
    String dob = dateOfBirthController.text;
    String selectedDate = selectedDateController.text;

    // Determine which date to use for age calculation
    int age = selectedDate.isNotEmpty
        ? calculateAgeOfSpecificTime(dob, selectedDate)
        : calculateAge(dob);

    String ageText = selectedDate.isNotEmpty
        ? getSelectedFormattedAge(dob, selectedDate)
        : getFormattedAge(dob);
    if (age >= 70) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('Golden Citizen'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 65) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('Senior Citizen'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 60) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('Older'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 55) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('Older Adult'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 50) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('First stage of Older Adult'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 45) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('Adult'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 40) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('Mid Adult'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 35) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('Mid Level Adult'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 30) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('Continue Adulthood'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 25) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('Younger Adult'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 20) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('First stage of Adult'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 15) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('Teenage'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 10) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('Adolescent'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 5) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('Child'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else if (age >= 1) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t$ageText)}'),
              content: const Text('Baby'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    } else {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                  'the age is\t${getFormattedAge(dateOfBirthController.text)}'),
              content: const Text('N/A'),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdviceScreen()));
                  },
                  child: Text('see Advice'),
                )
              ],
            );
          });
    }
  }

  Widget _dateOfBirth() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: dateOfBirthController,
        decoration: InputDecoration(
          labelText: 'Date of Birth',
          border: OutlineInputBorder(),
        ),
        onTap: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );

          if (selectedDate != null) {
            setState(() {
              dateOfBirthController.text =
                  DateFormat('yyyy-MM-dd').format(selectedDate);
              ageText = isSelectedDateVisible
                  ? getSelectedFormattedAge(
                      dateOfBirthController.text, selectedDateController.text)
                  : getFormattedAge(dateOfBirthController.text);
              _displayAgeRange();
            });
          }
        },
      ),
    );
  }

  Widget _selectedDate() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: selectedDateController,
        decoration: InputDecoration(
          labelText: 'Selected Date',
          border: OutlineInputBorder(),
        ),
        onTap: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );

          if (selectedDate != null) {
            setState(() {
              selectedDateController.text =
                  DateFormat('yyyy-MM-dd').format(selectedDate);
              ageText = isSelectedDateVisible
                  ? getSelectedFormattedAge(
                      dateOfBirthController.text, selectedDateController.text)
                  : getFormattedAge(dateOfBirthController.text);
              _displayAgeRange();
            });
          }
        },
      ),
    );
  }

  String getFormattedAge(String dob) {
    if (dob.isEmpty) {
      return 'N/A'; // Return 'N/A' if DOB is not provided
    }

    DateTime currentDate = DateTime.now();
    DateTime birthDate = DateFormat('yyyy-MM-dd').parse(dob);

    int ageYears = currentDate.year - birthDate.year;
    int ageMonths = currentDate.month - birthDate.month;
    int ageDays = currentDate.day - birthDate.day;

    if (ageDays < 0) {
      ageMonths--;
      ageDays += DateTime(currentDate.year, currentDate.month - 1, 0).day;
    }

    if (ageMonths < 0) {
      ageYears--;
      ageMonths += 12;
    }

    return '$ageYears years, $ageMonths months, $ageDays days';
  }
}

String getSelectedFormattedAge(String dob, String selectedDate) {
  if (dob.isEmpty || selectedDate.isEmpty) {
    return 'N/A'; // Return 'N/A' if DOB or selectedDate is not provided
  }

  DateTime selectedDateValue = DateFormat('yyyy-MM-dd').parse(selectedDate);
  DateTime birthDate = DateFormat('yyyy-MM-dd').parse(dob);

  int ageYears = selectedDateValue.year - birthDate.year;
  int ageMonths = selectedDateValue.month - birthDate.month;
  int ageDays = selectedDateValue.day - birthDate.day;

  if (ageDays < 0) {
    ageMonths--;
    ageDays +=
        DateTime(selectedDateValue.year, selectedDateValue.month - 1, 0).day;
  }

  if (ageMonths < 0) {
    ageYears--;
    ageMonths += 12;
  }

  return '$ageYears years, $ageMonths months, $ageDays days';
}

// age calculation
int calculateAge(String dob) {
  if (dob.isEmpty) {
    return 0; // Return 0 if DOB is not provided
  }

  DateTime currentDate = DateTime.now();
  DateTime birthDate = DateFormat('yyyy-MM-dd').parse(dob);

  int age = currentDate.year - birthDate.year;

  // Adjust age based on month and day
  if (currentDate.month < birthDate.month ||
      (currentDate.month == birthDate.month &&
          currentDate.day < birthDate.day)) {
    age--;
  }

  return age;
}

int calculateAgeOfSpecificTime(String birthday, String selectedDay) {
  if (birthday.isEmpty || selectedDay.isEmpty) {
    return 0;
  }
  DateTime selectedData = DateFormat('yyyy-MM-dd').parse(selectedDay);
  DateTime birthDate = DateFormat('yyyy-MM-dd').parse(birthday);

  int currentAge = selectedData.year - birthDate.year;
  if (selectedData.month < birthDate.month ||
      (selectedData.month == birthDate.month &&
          selectedData.day < birthDate.day)) {
    currentAge--;
  }
  return currentAge;
}
