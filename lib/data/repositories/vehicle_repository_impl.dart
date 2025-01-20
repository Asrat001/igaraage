
import 'package:dartz/dartz.dart';
import 'package:garaage/data/datasources/vehicle_firebase_service.dart';
import 'package:garaage/data/models/vehicle/vehicle.dart';
import 'package:garaage/domain/repositories/vehicle.dart';

import '../../service_locator.dart';

class VehicleRepositoryImpl implements VehicleRepository{
  @override
  Future<Either> addVehicle(Vehicle vehicle) async{
    return await sl<VehicleFirebaseService>().addVehicle(vehicle);
  }

  @override
  Future<Either> getVehicle() async {
    // TODO: implement getVehicle
    return await sl<VehicleFirebaseService>().getVehicle();
  }

}