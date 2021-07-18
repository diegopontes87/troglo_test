import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:troglo_test/core/presentation/onboarding/controllers/login_controller.dart';
import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:troglo_test/shared/infrastructure/widgets/buttons/small_buttons/app_small_button_widget.dart';
import 'package:troglo_test/shared/infrastructure/widgets/textfields/app_text_field_widget.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';
import 'package:troglo_test/shared/res/app_assets.dart';
import 'package:troglo_test/shared/res/app_res.dart';
import 'package:troglo_test/shared/res/app_routes.dart';
import 'package:troglo_test/shared/theme/app_button_styles.dart';

class LoginPage extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          body: SafeArea(
            child: Container(
              height: Get.height,
              width: Get.width,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 70.propHeight(),
                          ),
                          height: 170.propHeight(),
                          child: Image.asset(AppAssets.logo),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 70.propHeight(),
                            left: 35.propWidth(),
                            right: 35.propWidth(),
                          ),
                          child: Form(
                            key: controller.formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppTextFormField(
                                  hintText: 'E-mail',
                                  hintStyle: AppRes.bodyTextOpacityOnbackground1.copyWith(color: Colors.grey.withOpacity(0.7)),
                                  style: AppRes.bodyText1,
                                  keyboardType: TextInputType.emailAddress,
                                  screenState: controller.screenState,
                                  prefixIcon: Icon(Icons.mail),
                                  textInputAction: TextInputAction.next,
                                  validator: (value) => controller.emailFieldValidator(
                                    value,
                                  ),
                                  textFieldController: controller.emailTextFieldController,
                                ),
                                AppTextFormField(
                                  margin: EdgeInsets.only(top: 25.propHeight()),
                                  hintText: 'Password',
                                  hintStyle: AppRes.bodyTextOpacityOnbackground1.copyWith(color: Colors.grey.withOpacity(0.7)),
                                  style: AppRes.bodyText1,
                                  keyboardType: TextInputType.visiblePassword,
                                  screenState: controller.screenState,
                                  prefixIcon: Icon(Icons.lock),
                                  textInputAction: TextInputAction.done,
                                  isPassword: true,
                                  validator: (value) => controller.passwordFieldValidator(
                                    value,
                                  ),
                                  textFieldController: controller.passwordTextFieldController,
                                ),
                                AppSmallButtonWidget(
                                  margin: EdgeInsets.only(top: 25.propHeight()),
                                  function: () async {
                                    await controller.fieldsValidator();
                                  },
                                  buttonStyle: AppButtonStyles.primaryButtonStyle(context),
                                  buttonText: 'Login',
                                  screenState: controller.screenState,
                                  textColor: AppRes.appColorTheme.onPrimary,
                                ),
                                AppSmallButtonWidget(
                                  margin: EdgeInsets.only(top: 15.propHeight()),
                                  function: () {
                                    controller.goToPage(AppRoutes.signUpInfoPage);
                                  },
                                  buttonStyle: AppButtonStyles.primaryVariantButtonStyle(context),
                                  buttonText: 'Sign Up',
                                  screenState: ScreenState.normalState,
                                  textColor: AppRes.appColorTheme.primary,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
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
}
