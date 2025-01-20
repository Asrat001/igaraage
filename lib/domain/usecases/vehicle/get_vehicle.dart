
import 'package:dartz/dartz.dart';

import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../../repositories/vehicle.dart';

class GetVehicleUseCase implements UseCase<Either, void> {
  @override
  Future<Either> call({void params}) async {
    return sl<VehicleRepository>().getVehicle();
  }
}