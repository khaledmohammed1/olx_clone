import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constance.dart';
import 'package:shopping_app/controllers/location_controller.dart';
import 'package:shopping_app/controllers/sell_car_form_controller.dart';
import 'package:shopping_app/screens/widgets/custom_text_fom_field.dart';

class SellCarForm extends StatelessWidget {
  SellCarForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget _appbar(String title) {
      return AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          title,
          style:
              const TextStyle(color: primaryColor, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      );
    }
    Widget _brandList() {
      return Dialog(
        child: GetBuilder<SellCarFormController>(
          init: Get.put(SellCarFormController()),
          builder: (controller) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _appbar("Car Brands"),
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.models.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        controller.chooseModel(index);
                      },
                      title: Text(
                        controller.models[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    );
                  }),
            ],
          ),
        ),
      );
    }
    Widget _listView(){
      return Dialog(
        child: GetBuilder<SellCarFormController>(
          init: Get.put(SellCarFormController()),
          builder: (controller) =>
              Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _appbar("Car Fuel"),
              const Divider(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.fuelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        controller.chooseFuel(index);
                      },
                      title: Text(
                        controller.fuelList[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    );
                  }),
            ],
          ),
        ),
      );
    }
    Widget _listView2(){
      return Dialog(
        child: GetBuilder<SellCarFormController>(
          init: Get.put(SellCarFormController()),
          builder: (controller) =>
              Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _appbar("Transmission"),
              const Divider(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.transmissionList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        controller.chooseTransmission(index);
                      },
                      title: Text(
                        controller.transmissionList[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    );
                  }),
            ],
          ),
        ),
      );
    }
    Widget _listView3(){
      return Dialog(
        child: GetBuilder<SellCarFormController>(
          init: Get.put(SellCarFormController()),
          builder: (controller) =>
              Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _appbar("No Of Owners"),
              const Divider(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.noOfOwnerList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      onTap: () {
                        controller.chooseOwner(index);
                      },
                      title: Text(
                        controller.noOfOwnerList[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    );
                  }),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Sell Your Car",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<SellCarFormController>(
        init: Get.put(SellCarFormController()),
        builder: (controller) => SafeArea(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Choose Car Details ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return _brandList();
                            });
                      },
                      child: CustomTextFormField(
                          enabled: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Can't be empty";
                            }
                            return null;
                          },
                          text: "Brand / Model",
                          hint: controller.modelTextEditingController.text == ""
                              ? "enter car brand or model"
                              : controller.modelTextEditingController.text,
                          onSave: (v) {}),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Can't be empty";
                        }
                        return null;
                      },
                      controller: controller.yearTextEditingController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Year*",
                      ),
                    ),

                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Can't be empty";
                        }
                        return null;
                      },
                      controller: controller.priceTextEditingController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Price*",
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return _listView();
                        });
                      },
                      child: CustomTextFormField(
                        enabled: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Can't be empty";
                            }
                            return null;
                          },
                          keyBoardType: TextInputType.number,
                          text: "Fuel*",
                          hint: controller.fuelTextEditingController.text == ""
                              ? ""
                              : controller.fuelTextEditingController.text,
                          onSave: (v) {}),
                    ),const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return _listView2();
                        });
                      },
                      child: CustomTextFormField(
                        enabled: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Can't be empty";
                            }
                            return null;
                          },
                          keyBoardType: TextInputType.number,
                          text: "Transmission*",
                          hint: controller.transmissionTextEditingController.text == ""
                              ? ""
                              : controller.transmissionTextEditingController.text,
                          onSave: (v) {}),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Can't be empty";
                        }
                        return null;
                      },
                      controller: controller.kmTextEditingController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "KM Driver*",

                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: (){
                        showDialog(context: context, builder: (BuildContext context){
                          return _listView3();
                        });
                      },
                      child: CustomTextFormField(
                          enabled: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Can't be empty";
                            }
                            return null;
                          },
                          keyBoardType: TextInputType.number,
                          text: "No Of Owners*",
                          hint: controller.ownerTextEditingController.text == ""
                              ? ""
                              : controller.ownerTextEditingController.text,
                          onSave: (v) {}),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Can't be empty";
                        }
                        return null;
                      },
                      controller: controller.titleTextEditingController,
                      decoration: const InputDecoration(
                        labelText: "Add title*",
                        hintText: "Enter car title with brand" ,
                      ),
                    ),
                    TextFormField(
                      maxLines: 6,
                      maxLength: 300,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Can't be empty";
                        }
                        return null;
                      },
                      controller: controller.descriptionTextEditingController,
                      decoration: const InputDecoration(
                        labelText: "Description*",
                        hintText: "Enter more details about car features,condition and reason for sell",

                      ),
                    ),
                    GetBuilder<LocationController>(
                      init: Get.put(LocationController()),
                      builder:(locationController)=>
                          TextFormField(
                            minLines: 2,
                            maxLines: 4,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Can't be empty";
                              }
                              return null;
                            },
                            onTap: (){
                              controller.addressTextEditingController.text = locationController.address.toString();
                            },
                            controller: controller.addressTextEditingController,
                            decoration: const InputDecoration(
                              labelText: "Address*",
                            ),
                          ),
                          ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomSheet: GetBuilder<SellCarFormController>(
        init:  Get.put(SellCarFormController()),
        builder:(controller)=> Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: NeumorphicButton(
                  style: const NeumorphicStyle(color: primaryColor),
                  child: const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Text(
                      "Next",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    controller.validate();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
