import 'package:garaage/data/models/vehicle/vehicle.dart';

class VehicleState{
  final isLoading;
  final Vehicle? vehicle;
  final String errorMsg;
  VehicleState({required this.isLoading, required this.vehicle,required this.errorMsg});
}