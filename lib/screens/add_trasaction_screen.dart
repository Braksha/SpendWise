import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController paidController = TextEditingController();
  String? selectedCategory;

  List<String> categories = [
    'Category 1',
    'Category 2',
    'Category 3',
    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Transaction Name',
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: Colors.black38),
                ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Container(
              width: 260,
              height: 200,
              child: TextField(
                controller: paidController,
                decoration: InputDecoration(
                  labelText: 'Paid Amount',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Spacer(),
            SizedBox(height: 16),
            Container(
              width: 200,
              height: 200,
              child: DropdownButtonFormField<String>(
                value: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Paid Type',
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                ),
                items: categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Row(
                      children: [
                        Icon(
                          Icons.category_rounded,
                          color: Colors.blue,
                        ),
                        Text('Paid Type'),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              // Handle form submission here
              print('Name: ${nameController.text}');
              print('Paid Amount: ${paidController.text}');
              print('Category: $selectedCategory');
            },
            child: Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    paidController.dispose();
    super.dispose();
  }
}
