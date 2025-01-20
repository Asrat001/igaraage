class Vehicle {
  final String name;
  final String vin;
  final String status;
  final String description;
  final String transmission;
  final String numSeats;
  final String errors;
  final String fuelConsumed;
  final String totalFuel;
  final String speed;
  final String rpm;
  final String battery;
  final String oil;
  final String coolantCurrent;
  final String coolantDesired;
  final String image;
  final List<String> errorCodes;


  Vehicle({
    required this.name,
    required this.vin,
    required this.status,
    required this.battery,
    required this.description,
    required this.speed,
    required this.numSeats,
    required this.rpm,
    required this.fuelConsumed,
    required this.transmission,
    required this.oil,
    required this.coolantCurrent,
    required this.coolantDesired,
    required this.totalFuel,
    required this.errors,
    required this.image,
    required this.errorCodes,
  });


  factory Vehicle.fromMap(Map<String,dynamic> map){
    return Vehicle(
      name: map['name'] as String,
      vin: map['vin'] as String,
      status: map['status'] as String,
      battery: map['battery'] as String,
      description: map['description'] as String,
      speed: map['speed'] as String,
      numSeats: map['numSeats'] as String,
      rpm: map['rpm'] as String,
      fuelConsumed: map['fuelConsumed'] as String,
      transmission: map['transmission'] as String,
      oil: map['oil'] as String,
      coolantCurrent: map['coolantCurrent'] as String,
      coolantDesired: map['coolantDesired'] as String,
      totalFuel: map['totalFuel'] as String,
      errors: map['errors'] as String,
      image: map['image'] as String,
      errorCodes: List<String>.from(map['errorCodes'] as List),
    );
  }



}