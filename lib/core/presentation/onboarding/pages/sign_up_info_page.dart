import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:troglo_test/core/presentation/onboarding/controllers/sign_up_info_controller.dart';
import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:troglo_test/shared/infrastructure/widgets/app_snack_bar.dart';
import 'package:troglo_test/shared/infrastructure/widgets/buttons/small_buttons/app_small_button_widget.dart';
import 'package:troglo_test/shared/infrastructure/widgets/dropdown/app_dropdown_menu_widget.dart';
import 'package:troglo_test/shared/infrastructure/widgets/textfields/app_text_field_widget.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';
import 'package:troglo_test/shared/res/app_assets.dart';
import 'package:troglo_test/shared/res/app_res.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';
import 'package:troglo_test/shared/res/app_routes.dart';
import 'package:troglo_test/shared/theme/app_button_styles.dart';

class SignUpInfoPage extends GetWidget<SignUpInfoController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpInfoController>(
      builder: (_) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          body: SafeArea(
            child: Container(
              height: Get.height,
              child: Stack(
                children: [
                  Image.asset(AppAssets.signUp),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: AppRes.appColorTheme.background,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AppTextWidget(
                                textAlign: TextAlign.center,
                                margin: EdgeInsets.only(top: 30.propHeight()),
                                text: 'Hello, welcome to Troglo!',
                                style: AppRes.headline3,
                              ),
                              AppTextFormField(
                                margin: EdgeInsets.only(
                                  top: 18.propHeight(),
                                  left: 35.propWidth(),
                                  right: 35.propWidth(),
                                ),
                                hintText: 'First name',
                                hintStyle: AppRes.bodyTextOpacityOnbackground1.copyWith(color: Colors.grey.withOpacity(0.7)),
                                style: AppRes.bodyText1,
                                keyboardType: TextInputType.emailAddress,
                                screenState: controller.screenState,
                                textInputAction: TextInputAction.next,
                                textFieldController: controller.nameTextFieldController,
                                validator: (value) => controller.firstNameFieldValidator(
                                  value,
                                  getErrorSnackBar,
                                ),
                              ),
                              AppTextFormField(
                                margin: EdgeInsets.only(
                                  top: 18.propHeight(),
                                  left: 35.propWidth(),
                                  right: 35.propWidth(),
                                ),
                                hintText: 'Last name',
                                hintStyle: AppRes.bodyTextOpacityOnbackground1.copyWith(color: Colors.grey.withOpacity(0.7)),
                                style: AppRes.bodyText1,
                                keyboardType: TextInputType.emailAddress,
                                screenState: controller.screenState,
                                textInputAction: TextInputAction.next,
                                textFieldController: controller.lastNameTextFieldController,
                                validator: (value) => controller.lastNameFieldValidator(
                                  value,
                                  getErrorSnackBar,
                                ),
                              ),
                              AppTextFormField(
                                margin: EdgeInsets.only(
                                  top: 18.propHeight(),
                                  left: 35.propWidth(),
                                  right: 35.propWidth(),
                                ),
                                hintText: 'Date of Birth',
                                hintStyle: AppRes.bodyTextOpacityOnbackground1.copyWith(color: Colors.grey.withOpacity(0.7)),
                                style: AppRes.bodyText1,
                                keyboardType: TextInputType.number,
                                screenState: controller.screenState,
                                textInputAction: TextInputAction.next,
                                textFieldController: controller.dateOfBirthTextFieldController,
                                validator: (value) => controller.birthDateFieldValidator(
                                  value,
                                  getErrorSnackBar,
                                ),
                                inputFormatters: [controller.dateMaskFormatter],
                              ),
                              AppDropdownMenuWidget(
                                margin: EdgeInsets.only(
                                  top: 18.propHeight(),
                                  left: 35.propWidth(),
                                  right: 35.propWidth(),
                                ),
                                onChange: (value) {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  controller.changeGenderStatus(value);
                                },
                                groupNamesList: controller.genderList,
                                selectedStatus: controller.selectedGender,
                              ),
                              AppDropdownMenuWidget(
                                margin: EdgeInsets.only(
                                  top: 18.propHeight(),
                                  left: 35.propWidth(),
                                  right: 35.propWidth(),
                                ),
                                onChange: (value) {
                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  controller.changeGenitaliaStatus(value);
                                },
                                groupNamesList: controller.genitaliaList,
                                selectedStatus: controller.selectedGenitalia,
                              ),
                              AppSmallButtonWidget(
                                margin: EdgeInsets.only(top: 25.propHeight()),
                                function: () {
                                  controller.validateDataAndGoToNextPage(getErrorSnackBar);
                                },
                                buttonStyle: AppButtonStyles.primaryButtonStyle(context),
                                buttonText: 'Next',
                                screenState: controller.screenState,
                                textColor: AppRes.appColorTheme.onPrimary,
                              ),
                              AppSmallButtonWidget(
                                margin: EdgeInsets.only(
                                  top: 15.propHeight(),
                                  bottom: 10.propHeight(),
                                ),
                                function: () {
                                  controller.goBack();
                                },
                                buttonStyle: AppButtonStyles.primaryVariantButtonStyle(context),
                                buttonText: 'Back',
                                screenState: ScreenState.normalState,
                                textColor: AppRes.appColorTheme.primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getErrorSnackBar(String errorTitle, String errorMessage) {
    AppSnackBar.getErrorSnackBar(
      title: errorTitle,
      message: errorMessage,
    );
  }
}
