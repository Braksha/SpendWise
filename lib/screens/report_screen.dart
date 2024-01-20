import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:spendwise/widgets/bar_graph.dart';


 class ReportScreen extends StatefulWidget {
     ReportScreen({super.key});

   @override
   State<ReportScreen> createState() => _ReportScreenState();
 }

 class _ReportScreenState extends State<ReportScreen> {
   List <double> weeklySummaryExpense = [
     59.7,
     59.7,
     59.7,
     59.7,
     46.7,
     46.7,
     46.7,
   ];
   List <double> weeklySummaryIncome = [
     159.7,
     519.7,
     591.7,
     591.7,
     416.7,
     416.7,
     406.7,
   ];

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(),
       body: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
           children:[
             Row(
               children: [
                 Text("Report",
                   style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20
                   ),
                 ),
                 Spacer(),
                 Icon(
                     Icons.calendar_month
                 ),

               ],
             ),
            SizedBox(
              height: 100,
            ),
            Container(

              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width * 0.99,

              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20)
              ),

              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(

                    child: MyGraph(
                       weeklySummaryExpense: weeklySummaryExpense,
                      weeklySummaryIncom: weeklySummaryIncome,
                    ),),
              ),
            ),
          SizedBox(
            height: 80,
          ),
          Text("This week",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          ),
           ],
         ),

       ) ,
     );
   }
 }
