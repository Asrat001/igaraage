import 'package:flutter/material.dart';
import 'package:garaage/common/widgets/my_app_bar.dart';
import 'package:garaage/common/widgets/my_button.dart';
import 'package:garaage/common/widgets/my_input_filed.dart';
import 'package:garaage/data/models/vehicle/vehicle.dart';
import 'package:garaage/domain/usecases/vehicle/get_vehicle.dart';
import 'package:garaage/domain/usecases/vehicle/vehicle.dart';
import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/app_text.dart';
import '../../../core/error/error_handler.dart';
import '../../../service_locator.dart';
import '../../navigation/pages/navigation.dart';

class AddCarInfo extends StatelessWidget {
  static String routeName = '/add_info';
  AddCarInfo({super.key});

  final TextEditingController vinController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController transmissionController = TextEditingController();
  final TextEditingController numSeatsController = TextEditingController();
  final TextEditingController fuelConsumedController = TextEditingController();
  final TextEditingController totalFuelController = TextEditingController();
  final TextEditingController rpmController = TextEditingController();
  final TextEditingController batteryController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MyAppBar(
        leading: true,
        title: Text("Add Car info",
          style: AppText.pageTitleText.copyWith(color: AppColors.headingText),
        ),

      ),
      body:SingleChildScrollView(
        padding:const EdgeInsets.symmetric(horizontal: 20),
        child:Column(
          children: [
            SizedBox(height: 24,),
            MyInputFiled(label: "Vin",hintText: "1NXBR32E85Z505904",textEditingController: vinController,),
            const SizedBox(height: 16,),
            Row(
              children: [
                Expanded(child: MyInputFiled(label: "Name",hintText: "Toyota",textEditingController: nameController,)),
                const SizedBox(width: 5,),
                Expanded(child: MyInputFiled(label: "Transmission",hintText: "Auto",textEditingController: transmissionController,)),
              ],
            ),
            const SizedBox(height: 16,),
            MyInputFiled(label: "Description",hintText: "2005 Base.....",textEditingController: descriptionController,),
            const SizedBox(height: 16,),
            Row(
              children: [
                Expanded(child: MyInputFiled(label: "Number of Seats",hintText: "5",textEditingController: numSeatsController,)),
                const SizedBox(width: 5,),
                Expanded(child: MyInputFiled(label: "Rpm",hintText: "2731",textEditingController: rpmController,)),
              ],
            ),
            const SizedBox(height: 16,),
            MyInputFiled(label: "FuelConsumed",hintText: "70",textEditingController: fuelConsumedController,),
            const SizedBox(height: 16,),
            Row(
              children: [
                Expanded(child: MyInputFiled(label: "TotalFuel",hintText: "100",textEditingController: totalFuelController,)),
                const SizedBox(width: 5,),
                Expanded(child: MyInputFiled(label: "Battery",hintText: "80",textEditingController: batteryController,)),
              ],
            ),
            const SizedBox(height: 24,),
            MyButton(type: "primary", text: "Add",onPressed: () async{
               var result= await sl<AddVehicleUseCase>().call(
                 params: Vehicle(
                     name: nameController.text.toString(),
                     vin: vinController.text.toString(),
                     status: "connected",
                     battery: batteryController.text.toString(),
                     description: descriptionController.text.toString(),
                     speed: '20',
                     numSeats: numSeatsController.text.toString(),
                     rpm: rpmController.text.toString(),
                     fuelConsumed: fuelConsumedController.text.toString(),
                     transmission: transmissionController.text.toString(),
                     oil: "100",
                     coolantCurrent: "90",
                     coolantDesired: "100",
                     totalFuel: totalFuelController.text.toString(),
                     errors: "3",
                     image: "",
                     errorCodes: [" ",""]
                 )
               );
               result.fold(
                     (l) => ErrorHandler.handleError(context, l),
                     (r) async {
                    print("herere");
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      NavigationPage.routeName,
                          (route) => false,
                    );

                 },
               );
            },)

          ],
        ),
      ),
    );
  }

}
