// class BatteryModel {
//   double width;
//   double height;
//   double length;
//   double milliampere;
//   double maxCharge;

//   BatteryModel(
//       {required this.width,
//       required this.height,
//       required this.length,
//       required this.milliampere,
//       required this.maxCharge});

//   bool discharged = true;
//   double chargeAmount = 0;

//   void recarregar() {
//     if (chargeAmount == 0) {
//       while (chargeAmount < maxCharge) {
//         chargeAmount += 10;
//       }
//     }
//   }

//   void fullLoad() {
//     chargeAmount = maxCharge;
//   }
// }
