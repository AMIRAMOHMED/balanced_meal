import 'dart:developer';

import 'package:balanced_meal/widgets/screen/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:balanced_meal/models/user_model.dart';
import 'package:balanced_meal/provider/user_provider.dart';
import 'package:balanced_meal/widgets/screen/material_buttom.dart';
import 'package:balanced_meal/widgets/screen/textformfeildwidget.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final genderList = ["Male", "Female"];
  String? value, selectedGender;

  late final TextEditingController _ageController;
  late final FocusNode _ageFoucusNode;
  late final _formKey = GlobalKey<FormState>();
  late final TextEditingController _heightController;
  late final FocusNode _heightFoucusNode;
  late final TextEditingController _weightController;
  late final FocusNode _weightFoucusNode;

  @override
  void dispose() {
    _weightController.dispose();
    _weightFoucusNode.dispose();
    _heightController.dispose();
    _heightFoucusNode.dispose();
    _ageFoucusNode.dispose();
    _ageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _weightController = TextEditingController();
    _weightFoucusNode = FocusNode();
    _heightController = TextEditingController();
    _heightFoucusNode = FocusNode();
    _ageFoucusNode = FocusNode();
    _ageController = TextEditingController();
    super.initState();
  }

  Widget textLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF474747),
      ),
    );
  }

  DropdownMenuItem<String> buildMenunItem(String item) =>
      DropdownMenuItem(value: item, child: Text(item));

  Future<void> _sendDetails() async {
    final isValid = _formKey.currentState!.validate();

    FocusScope.of(context).unfocus();
    if (isValid) {
      final double weight = double.parse(_weightController.text);
      final double height = double.parse(_heightController.text);
      final double age = double.parse(_ageController.text);
      final String uI = const Uuid().v4();
      final userProvider = Provider.of<UserProvider>(context, listen: false);

      UserModel newUser = UserModel(
        weight,
        height,
        age,
        uI,
        gendre: selectedGender!,
      );
      userProvider.setUser(newUser);
     userProvider.setCalculateCalForUser(gender: newUser.gendre, newUser: newUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFFBFBFB),
        appBar: const AppBarWidget(text: "Enter Your Details")
        
       ,
        body: Center(
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  Form(
                    key: _formKey,
                    child: SizedBox(
                      height: 600,
                      width: 327,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textLabel("Grande"),
                          DropdownButtonFormField<String>(
                            hint: const Text("Choose your gender"),
                            value: value,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            items: genderList.map(buildMenunItem).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedGender = value;
                              });
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Please select your gender';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          textLabel("Weight"),
                          CustomeTextFormFeild(
                            textController: _weightController,
                            onFeildFun: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_heightFoucusNode);
                            },
                            hintText: 'Enter Your Weight',
                            suffixText: 'Kg',
                            foucseController: _weightFoucusNode,
                            textInPutAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          textLabel("Height"),
                          CustomeTextFormFeild(
                            textController: _heightController,
                            textInPutAction: TextInputAction.next,
                            onFeildFun: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_ageFoucusNode);
                            },
                            hintText: 'Enter your Height ',
                            suffixText: 'cm',
                            foucseController: _heightFoucusNode,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          textLabel("Age"),
                          CustomeTextFormFeild(
                            textController: _ageController,
                            onFeildFun: (value) {},
                            suffixText: 'years',
                            foucseController: _ageFoucusNode,
                            hintText: "Enter your age in years",
                            textInPutAction: TextInputAction.done,
                          )
                        ],
                      ),
                    ),
                  ),
                  MaterialButtom(
                    text: "Next",
                    colorButtom: _formKey.currentState?.validate() ?? false
                        ? const Color(0xFFFA6400)
                        : const Color(0xFFEAECF0),
                    colorText: const Color(0xFF959595),
                    fun: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _sendDetails().then((_) {
                          Navigator.pushNamed(context, 'creatYourOrderScreen');
                        }).catchError((error) {
                          log("Error: $error");
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Please fill out the form correctly.")));
                      }
                    },
                    paddingHori: 100,
                    paddingVer: 20,
                    borderRadius: 12,
                  ),
                ],
              ))));
            
          
    
   
    
  }
}