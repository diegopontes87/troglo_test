import 'package:flutter/material.dart';

class AppButtonStyles {
  //Primary Button Style with AppGreen color Background
  static ButtonStyle primaryButtonStyle(BuildContext context) {
    return ButtonStyle(
      shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled))
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Theme.of(context).colorScheme.primary.withOpacity(0.54)),
          );
        else {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Theme.of(context).colorScheme.primary),
          );
        }
      }),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled))
            return Theme.of(context).colorScheme.primary.withOpacity(0.54);
          else {
            return Theme.of(context).colorScheme.primary;
          }
        },
      ),
    );
  }

  static ButtonStyle primaryVariantButtonStyle(BuildContext context) {
    return ButtonStyle(
      shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled))
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Theme.of(context).colorScheme.primaryVariant.withOpacity(0.54)),
          );
        else {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Theme.of(context).colorScheme.primaryVariant),
          );
        }
      }),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled))
            return Theme.of(context).colorScheme.primaryVariant.withOpacity(0.54);
          else {
            return Theme.of(context).colorScheme.primaryVariant;
          }
        },
      ),
    );
  }

  //OnSecondary Button Style with White color Background
  static ButtonStyle onSecondaryButtonStyle(BuildContext context) {
    return ButtonStyle(
      shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled))
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            side: BorderSide(color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.2)),
          );
        else {
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            side: BorderSide(color: Theme.of(context).colorScheme.onSecondary),
          );
        }
      }),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.surface),
    );
  }

  //SecondaryVariant Button Style with ShadowBlack color Background
  static ButtonStyle secondaryVariantButtonStyle(BuildContext context) {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          side: BorderSide(color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.6)),
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onSecondary.withOpacity(0.6)),
    );
  }
}
