
import 'package:dartz/dartz.dart';
import 'package:garaage/core/usecase/usecase.dart';
import 'package:garaage/data/models/vehicle/vehicle.dart';
import 'package:garaage/domain/repositories/vehicle.dart';
import '../../../service_locator.dart';


class AddVehicleUseCase implements UseCase<Either, Vehicle> {
  @override
  Future<Either> call({Vehicle? params}) async {
    return sl<VehicleRepository>().addVehicle(params!);
  }
}