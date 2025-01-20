

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:garaage/data/models/vehicle/vehicle.dart';

import '../../core/error/failures.dart';

abstract class VehicleFirebaseService{
  Future<Either> addVehicle(Vehicle vehicle);
  Future<Either> getVehicle();
}

class VehicleFirebaseServiceImpl extends VehicleFirebaseService{
  @override
  Future<Either> addVehicle(Vehicle vehicle) async {
    // TODO: implement addVehicle
    final currentFireBaseUser = FirebaseAuth.instance.currentUser;
     try{
       // Save Vehicle data to Firestore
       await FirebaseFirestore.instance.collection('Users').doc(currentFireBaseUser?.uid).collection("Vehicles").doc("${currentFireBaseUser?.uid}-${vehicle.name}").set(
         {
           'vin':vehicle.vin,
           'status':vehicle.status,
           'name': vehicle.name,
           'description':vehicle.description,
           'transmission': vehicle.transmission,
           'numSeats': vehicle.numSeats,
           'errors': vehicle.errors,
           'fuelConsumed':vehicle.fuelConsumed,
           'totalFuel':vehicle.totalFuel,
           'speed':vehicle.speed,
           'rpm':vehicle.rpm,
           'battery':vehicle.battery,
           'oil':vehicle.oil,
           'coolantCurrent':vehicle.coolantCurrent,
           'coolantDesired': vehicle.coolantCurrent,
           'image':vehicle.image,
           'errorCodes': vehicle.errorCodes
         },
       );
       return const Right('Car Added successfully.');
     } catch(e){
       return Left(ServerFailure("error", e.toString()));
     }
  }

  @override
  Future<Either> getVehicle() async {
    final currentFireBaseUser = FirebaseAuth.instance.currentUser;
    try{
      QuerySnapshot userVehicles = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentFireBaseUser?.uid)
          .collection('Vehicles')
          .get();
      final userVehiclesData = userVehicles.docs.map((e) => e.data()).toList();
      if (userVehiclesData.isNotEmpty) {
        final vehicleData = userVehiclesData[0] as Map<String, dynamic>;
        final userVehicle=Vehicle(
            name: vehicleData['name'],
            vin: vehicleData['vin'],
            status: vehicleData['status'],
            battery: vehicleData['battery'],
            description: vehicleData['description'],
            speed: vehicleData['speed'],
            numSeats: vehicleData['numSeats'],
            rpm: vehicleData['rpm'],
            fuelConsumed: vehicleData['fuelConsumed'],
            transmission: vehicleData['transmission'],
            oil: vehicleData['oil'],
            coolantCurrent: vehicleData['coolantCurrent'],
            coolantDesired: vehicleData['coolantDesired'],
            totalFuel: vehicleData['totalFuel'],
            errors: vehicleData['errors'],
            image: vehicleData['image'],
            errorCodes:List<String>.from(vehicleData['errorCodes'] as List)
        );

        return Right(userVehicle);
      }else{
        return Left(null);
      }
    }catch(e){
      return Left(ServerFailure("error",e.toString()));
    }

  }

}