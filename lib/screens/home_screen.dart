import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
        height: 150,
        width: MediaQuery
            .of(context)
            .size
            .width * 0.9,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 32, 82, 123),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Column(
          children: [
            SizedBox(height: 24),
            Text(
              'Total Balance',
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            Text(
              '4500.00 LD',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 32,),
      Center(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5,color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                    Icon(
                    Icons.arrow_circle_down_outlined,
                    color: Colors.green,
                      size: 50,
                  ),
                    const Text(
                      "Income",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      "10.500.00 LD",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

              ]),
        ),

                Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5,color: Colors.grey),

                    borderRadius: BorderRadius.circular(12),

                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Icon(
                          Icons.arrow_circle_up_outlined,
                          color: Colors.red,
                          size: 50,
                        ),
                        const Text(
                          "Expense",
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          "6.000.00 LD",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                      ]),
                ),
        ],
      ),
    ),)
    ,
    ]
    ,
    )
    ,
    );
  }
}
