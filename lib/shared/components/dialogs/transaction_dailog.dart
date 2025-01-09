import 'package:flutter/material.dart';
import '../../../features/self_service/utils/selfservice_customer_responsive.dart';
import '../../../features/self_service/theme/selfservice_customer_dashboard_colors.dart';

class TransactionDialog extends StatefulWidget {
  final String title;
  final bool showRecipient;
  final Function(double amount, String? recipientId) onSubmit;

  const TransactionDialog({
    Key? key,
    required this.title,
    this.showRecipient = false,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<TransactionDialog> createState() => _TransactionDialogState();
}

class _TransactionDialogState extends State<TransactionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _recipientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          SelfserviceCustomerResponsive.getBorderRadius(context),
        ),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: SelfserviceCustomerResponsive.getHeadingSize(context),
          color: SelfserviceCustomerDashboardColors.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    SelfserviceCustomerResponsive.getBorderRadius(context),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an amount';
                }
                if (double.tryParse(value) == null ||
                    double.parse(value) <= 0) {
                  return 'Please enter a valid amount';
                }
                return null;
              },
            ),
            if (widget.showRecipient) ...[
              SizedBox(
                  height: SelfserviceCustomerResponsive.getSpacing(context)),
              TextFormField(
                controller: _recipientController,
                decoration: InputDecoration(
                  labelText: 'Recipient Account ID',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      SelfserviceCustomerResponsive.getBorderRadius(context),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter recipient account ID';
                  }
                  return null;
                },
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: SelfserviceCustomerDashboardColors.text,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: _handleSubmit,
          style: ElevatedButton.styleFrom(
            backgroundColor: SelfserviceCustomerDashboardColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                SelfserviceCustomerResponsive.getBorderRadius(context),
              ),
            ),
          ),
          child: Text('Submit'),
        ),
      ],
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      final amount = double.parse(_amountController.text);
      final recipientId =
          widget.showRecipient ? _recipientController.text : null;
      widget.onSubmit(amount, recipientId);
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _recipientController.dispose();
    super.dispose();
  }
}
