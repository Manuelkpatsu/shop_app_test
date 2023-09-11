import 'package:flutter/material.dart';

import 'generic_dialog.dart';

Future<bool> showConfirmationDialog({
  required BuildContext context,
  required double totalCost,
}) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Confirm Purchase?',
    content: 'Grand Total: \$${totalCost.toStringAsFixed(2)}',
    optionsBuilder: () => {
      'Cancel': false,
      'Confirm': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
