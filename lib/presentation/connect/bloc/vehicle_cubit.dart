import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garaage/domain/usecases/vehicle/get_vehicle.dart';
import 'package:garaage/presentation/connect/bloc/vehicle_state.dart';

import '../../../service_locator.dart';

class VehicleCubit extends Cubit<VehicleState> {
  VehicleCubit() : super(
    VehicleState(
        isLoading: true,
        vehicle: null,
       errorMsg: ""
    )
  );


  Future<void> fetchVehicleData() async {
    emit(VehicleState(isLoading: true, vehicle: null, errorMsg: ""));

    final result = await sl<GetVehicleUseCase>().call();
    result.fold(
            (l) {
          print("Error occurred: ${l.toString()}");
          emit(VehicleState(isLoading: false, vehicle: null, errorMsg: l.toString()));
        },
            (r) {
          print("Data fetched successfully: $r");
          emit(VehicleState(isLoading: false, vehicle: r, errorMsg: ""));
        }
    );
  }





  void clearVehicle() {
    emit(VehicleState(isLoading: false, vehicle: null, errorMsg: ""));
  }
}