import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:troglo_test/core/data/user/entities/user_info_entity.dart';
import 'package:troglo_test/shared/infrastructure/base/base_controller.dart';
import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_strings_extensions.dart';
import 'package:troglo_test/shared/res/app_routes.dart';

class SignUpInfoController extends BaseController {
  List<String> genderList = [
    "Agender",
    "Androgyne",
    "Androgynous",
    "Bigender",
    "Cisgender Man",
    "Cisgender Woman",
    "Female to Male",
    "Gender Fluid",
    "Gender Nonconforming",
    "Gender Questioning",
    "Gender Variant",
    "Genderqueer",
    "Intersex",
    "Male to Female",
    "Neither",
    "Neutrois",
    "Non-binary",
    "Other",
    "Pangender",
    "Transfeminine",
    "Transgender",
    "Transgender Man",
    "Transgender Person",
    "Transgender Woman",
    "Transmasculine",
    "Transsexual",
    "Transsexual Man",
    "Transsexual Person",
    "Transsexual Woman"
  ];
  List<String> genitaliaList = [
    'Male',
    'Female',
  ];

  String? selectedGenitalia = 'Genitalia';
  String? selectedGender = 'Gender';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameTextFieldController = TextEditingController();
  TextEditingController lastNameTextFieldController = TextEditingController();
  TextEditingController dateOfBirthTextFieldController = TextEditingController();
  MaskTextInputFormatter dateMaskFormatter = MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  void changeGenderStatus(String newGenderStatus) {
    selectedGender = newGenderStatus;
    changeScreenState(ScreenState.doneState);
  }

  void changeGenitaliaStatus(String newGenitaliaStatus) {
    selectedGenitalia = newGenitaliaStatus;
    changeScreenState(ScreenState.doneState);
  }

  String? firstNameFieldValidator(String? firstName, Function callbackError) {
    if (firstName == null || firstName.isEmpty) {
      callbackError('Missed Field:', "First name field can't be empty");
    } else {
      return '';
    }
  }

  String? lastNameFieldValidator(String? lastName, Function callbackError) {
    if (lastName == null || lastName.isEmpty) {
      callbackError('Missed Field:', "Last name field can't be empty");
    } else {
      return '';
    }
  }

  String? birthDateFieldValidator(String? birthDate, Function callbackError) {
    if (birthDate == null || birthDate.isEmpty) {
      callbackError('Missed Field:', "Birth date field can't be empty");
    } else if (!birthDate.isValidDateBirth('dd/MM/yyyy')) {
      callbackError('Missed Field:', "Birth date is not valid!");
    } else {
      return '';
    }
  }

  bool genderFieldValidator(Function callbackError) {
    if (selectedGender == 'Gender') {
      callbackError('Missed Field:', "Please choose a gender.");
      return false;
    }
    return true;
  }

  bool genitaliaFieldValidator(Function callbackError) {
    if (selectedGenitalia == 'Genitalia') {
      callbackError('Missed Field:', "Please choose a genitalia type.");
      return false;
    }
    return true;
  }

  void validateDataAndGoToNextPage(Function callbackError) {
    if (!formKey.currentState!.validate() && genitaliaFieldValidator(callbackError) && genderFieldValidator(callbackError)) {
      UserInfoEntity entity = UserInfoEntity(
          firstName: nameTextFieldController.text,
          lastName: lastNameTextFieldController.text,
          dateOfBirth: dateOfBirthTextFieldController.text,
          gender: selectedGender,
          genitalia: selectedGenitalia);
      print(entity.dateOfBirth);
      goToPageWithParameters(AppRoutes.signUpCredentialsPage, arguments: {'userinfo': entity});
    }
  }
}
