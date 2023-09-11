import 'package:flutter/material.dart' show BuildContext;

import 'generic_dialog.dart';

Future<bool> showConfirmedDialog({required BuildContext context}) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Order Confirmed',
    content: 'Thank you for shoping with us!',
    optionsBuilder: () => {
      'Ok': true,
    },
  ).then((value) => value ?? false);
}
