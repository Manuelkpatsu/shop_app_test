import 'package:flutter/material.dart';
import 'package:shop_app/util/currency.dart';

import 'generic_dialog.dart';

Future<bool> showConfirmationDialog({
  required BuildContext context,
  required double totalCost,
}) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Confirm Purchase?',
    content: 'Grand Total: ${Currency.formatCurrency(amount: totalCost)}',
    optionsBuilder: () => {
      'Cancel': false,
      'Confirm': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
