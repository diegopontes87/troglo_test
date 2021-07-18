import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:troglo_test/core/presentation/onboarding/controllers/sign_up_credentials_controller.dart';
import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:troglo_test/shared/infrastructure/widgets/app_snack_bar.dart';
import 'package:troglo_test/shared/infrastructure/widgets/buttons/small_buttons/app_small_button_widget.dart';
import 'package:troglo_test/shared/infrastructure/widgets/textfields/app_text_field_widget.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';
import 'package:troglo_test/shared/res/app_assets.dart';
import 'package:troglo_test/shared/res/app_res.dart';
import 'package:troglo_test/shared/res/app_routes.dart';
import 'package:troglo_test/shared/theme/app_button_styles.dart';

class SignUpCredentialsPage extends GetWidget<SignUpCredentialsController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpCredentialsController>(
      initState: (_) {
        controller.userInfoEntity = Get.arguments['userinfo'];
        print(controller.userInfoEntity?.firstName);
      },
      builder: (_) => GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Scaffold(
            body: SafeArea(
              child: Container(
                height: Get.height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 200.propHeight(),
                        child: Stack(children: [
                          Container(
                            height: 150.propHeight(),
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: AppRes.appColorTheme.primary,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: AppTextWidget(
                                text: 'Create Account',
                                style: AppRes.headline3.copyWith(color: AppRes.appColorTheme.background),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                color: AppRes.appColorTheme.background,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Image.asset(AppAssets.shortLogoPrimary),
                            ),
                          )
                        ]),
                      ),
                      Container(
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AppTextFormField(
                                margin: EdgeInsets.only(
                                  top: 18.propHeight(),
                                  left: 35.propWidth(),
                                  right: 35.propWidth(),
                                ),
                                hintText: 'Type your e-mail',
                                hintStyle: AppRes.bodyTextOpacityOnbackground1.copyWith(color: Colors.grey.withOpacity(0.7)),
                                style: AppRes.bodyText1,
                                keyboardType: TextInputType.emailAddress,
                                screenState: controller.screenState,
                                textInputAction: TextInputAction.next,
                                textFieldController: controller.emailTextFieldController,
                                validator: (value) => controller.emailFieldValidator(
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
                                hintText: 'Confirm your e-mail',
                                hintStyle: AppRes.bodyTextOpacityOnbackground1.copyWith(color: Colors.grey.withOpacity(0.7)),
                                style: AppRes.bodyText1,
                                keyboardType: TextInputType.emailAddress,
                                screenState: controller.screenState,
                                textInputAction: TextInputAction.next,
                                textFieldController: controller.confirmEmailTextFieldController,
                                validator: (value) => controller.confirmEmailFieldValidator(
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
                                hintText: 'Create a password',
                                hintStyle: AppRes.bodyTextOpacityOnbackground1.copyWith(color: Colors.grey.withOpacity(0.7)),
                                style: AppRes.bodyText1,
                                keyboardType: TextInputType.visiblePassword,
                                screenState: controller.screenState,
                                textInputAction: TextInputAction.next,
                                isPassword: true,
                                textFieldController: controller.passwordTextFieldController,
                                validator: (value) => controller.passwordFieldValidator(
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
                                hintText: 'Confirm Password',
                                hintStyle: AppRes.bodyTextOpacityOnbackground1.copyWith(color: Colors.grey.withOpacity(0.7)),
                                style: AppRes.bodyText1,
                                keyboardType: TextInputType.visiblePassword,
                                screenState: controller.screenState,
                                textInputAction: TextInputAction.next,
                                isPassword: true,
                                textFieldController: controller.confirmPasswordTextFieldController,
                                validator: (value) => controller.confirmPasswordFieldValidator(
                                  value,
                                  getErrorSnackBar,
                                ),
                              ),
                              Container(
                                height: 158,
                              ),
                              AppSmallButtonWidget(
                                margin: EdgeInsets.only(top: 25.propHeight()),
                                function: () async {
                                  await controller.fieldValidator();
                                },
                                buttonStyle: AppButtonStyles.primaryButtonStyle(context),
                                buttonText: 'Next',
                                screenState: controller.screenState,
                                loadingIndicatorColor: AppRes.appColorTheme.onPrimary,
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
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  getErrorSnackBar(String errorTitle, String errorMessage) {
    AppSnackBar.getErrorSnackBar(
      title: errorTitle,
      message: errorMessage,
    );
  }
}
