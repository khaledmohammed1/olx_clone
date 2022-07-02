import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:shopping_app/constance.dart';
import 'package:shopping_app/screens/widgets/custom_text_fom_field.dart';

class SellCarForm extends StatelessWidget {
  SellCarForm(this.models, {Key? key}) : super(key: key);
  List<dynamic> models;
  final _formKey = GlobalKey<FormState>();
  validate(){
    if(_formKey.currentState!.validate()){
      print("validate");
    }
  }

  @override
  Widget build(BuildContext context) {


    Widget _appbar(String title){
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
      title:  Text(
        title,
        style: const TextStyle(color: primaryColor,fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
    );
  }
    Widget _brandList(){
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
                   children: [
                    _appbar("Car Brands"),
                     const Divider(),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 8.0),
                       child: Text(models[0],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                     ),const Divider(),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 8.0),
                       child: Text(models[1],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                     ),const Divider(),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 8.0),
                       child: Text(models[2],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                     ),const Divider(),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 8.0),
                       child: Text(models[3],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                     ),const Divider(),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 8.0),
                       child: Text(models[4],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                     ),const Divider(),
                     Padding(
                       padding: const EdgeInsets.only(bottom: 8.0),
                       child: Text(models[5],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                     ),

                   ],
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
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Choose Car Details ",style: TextStyle(fontWeight: FontWeight.w700),),
                const SizedBox(height: 8,),
                InkWell(
                  onTap: (){
                    showDialog(context: context, builder: (BuildContext context){
                      return _brandList();
                    });
                  },
                  child: CustomTextFormField(
                    enabled: false,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Can't be empty";
                      }
                      return null;
                    },
                      text: "Brand / Model",
                      hint: "enter car brand or model",
                      onSave: (v) {

                      }),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Row(
        children: [
          Expanded(
             child: Padding(
              padding: const EdgeInsets.all(20),
               child:  NeumorphicButton(
                style: const NeumorphicStyle(color: primaryColor),
                 child: const Padding(
                   padding:  EdgeInsets.all(6.0),
                   child:  Text("Next",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                 ),
                 onPressed: (){
                  validate();
                 },
              ),
            ),
          )
        ],
      ),
    );
  }
}
