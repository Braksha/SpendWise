import 'individualBar.dart';

class BarData{
  final double SatAmount;
  final double SunAmount;
  final double ManAmount;
  final double TusAmount;
  final double WedAmount;
  final double TarsAmount;
  final double FriAmount;
  BarData({
    required this.SatAmount,
    required this.SunAmount,
    required this.ManAmount,
    required this.TusAmount,
    required this.WedAmount,
    required this.TarsAmount,
    required this.FriAmount,
  });

  List<IndividualBar> barData =[];

  void initialzeData(){
    barData = [
      IndividualBar(x: 0, y: SatAmount),
      IndividualBar(x: 1, y: SunAmount),
      IndividualBar(x: 2, y: ManAmount),
      IndividualBar(x: 3, y: TusAmount),
      IndividualBar(x: 4, y: WedAmount),
      IndividualBar(x: 5, y: TarsAmount),
      IndividualBar(x: 6, y: FriAmount),
    ];
  }
}
