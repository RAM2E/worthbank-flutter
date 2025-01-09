import 'package:banking_app_frontend/shared/services/api_service.dart';
import 'package:flutter/material.dart';

class CreateAccountForm extends StatefulWidget {
  final VoidCallback onClose;

  CreateAccountForm({required this.onClose}); // Add onClose callback

  @override
  _CreateAccountFormState createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _accountIdController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _balanceController = TextEditingController();

  String _message = '';
  Color _messageColor = Colors.black;
  bool _isProcessing = false;

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isProcessing = true;
        _message = '';
      });

      try {
        final response = await ApiService.post(
          '/api/admin/create',
          {
            'accountId': int.parse(_accountIdController.text),
            'fullName': _fullNameController.text,
            'email': _emailController.text,
            'password': _passwordController.text,
            'phoneNumber': _phoneNumberController.text,
            'address': _addressController.text,
            'status': 'ACTIVE',
            'balance': double.parse(_balanceController.text),
          },
        );

        final statusCode = response['statusCode'];
        final body = response['body'];
        final message = body['message'] ?? 'Operation completed successfully.';

        setState(() {
          _message = message;
          _messageColor = (statusCode == 200) ? Colors.green : Colors.red;
          _isProcessing = false;
        });

        // Close the form and return to the parent view on success
        if (statusCode == 200) {
          Future.delayed(Duration(seconds: 1), () {
            widget.onClose?.call(); // Trigger the onClose callback
          });
        }
      } catch (e) {
        setState(() {
          _isProcessing = false;
          _message = 'An error occurred: ${e.toString()}';
          _messageColor = Colors.red;
        });
        print("Error during API call: ${e.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: widget.onClose,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            width: isLargeScreen ? 600 : double.infinity,
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  _buildTextField(
                      _accountIdController, 'Account ID', TextInputType.number),
                  _buildTextField(
                      _fullNameController, 'Full Name', TextInputType.text),
                  _buildTextField(
                      _emailController, 'Email', TextInputType.emailAddress),
                  _buildTextField(
                      _passwordController, 'Password', TextInputType.text,
                      obscureText: true),
                  _buildTextField(_phoneNumberController, 'Phone Number',
                      TextInputType.phone),
                  _buildTextField(
                      _addressController, 'Address', TextInputType.text),
                  _buildTextField(
                      _balanceController, 'Balance', TextInputType.number),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      textStyle: TextStyle(fontSize: 18.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 5,
                    ),
                    child: _isProcessing
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _message,
                    style: TextStyle(
                      color: _messageColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      TextInputType keyboardType,
      {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.deepPurple[50],
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
