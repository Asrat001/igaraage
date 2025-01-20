

import 'package:dartz/dartz.dart';
import 'package:garaage/data/models/vehicle/vehicle.dart';

abstract class VehicleRepository{
Future<Either>addVehicle(Vehicle vehicle) ;
Future<Either>getVehicle();
}