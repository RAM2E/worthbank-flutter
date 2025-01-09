
import 'package:banking_app_frontend/shared/services/api_service.dart';
import 'package:flutter/material.dart';

class UpdateAccountForm extends StatefulWidget {
  final String accountId;
  final VoidCallback onClose;

  UpdateAccountForm({required this.accountId, required this.onClose});

  @override
  _UpdateAccountFormState createState() => _UpdateAccountFormState();
}

class _UpdateAccountFormState extends State<UpdateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _message = '';
  Color _messageColor = Colors.black;
  bool _isProcessing = false;

  // Method to load the account data based on the accountId
  void _loadAccountData() async {
    try {
      final response =
          await ApiService.get('/api/admin/view/${widget.accountId}');
      setState(() {
        _fullNameController.text = response['fullName'];
        _emailController.text = response['email'];
        _phoneNumberController.text = response['phoneNumber'];
        _addressController.text = response['address'];
        _passwordController.text = "";
      });
    } catch (e) {
      print(e);
      setState(() {
        _message = 'Failed to load account data.';
        _messageColor = Colors.red;
      });
    }
  }


  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isProcessing = true;
        _message = '';
      });

      try {
        final response = await ApiService.put(
          '/api/admin/update/${widget.accountId}',
          {
            'fullName': _fullNameController.text,
            'email': _emailController.text,
            'phoneNumber': _phoneNumberController.text,
            'address': _addressController.text,
          },
        );

        final statusCode = response['statusCode'];
        final message = response['message'] ?? 'Account updated successfully.';

        setState(() {
          _message = message;
          _messageColor = (statusCode == 200) ? Colors.green : Colors.red;
          _isProcessing = false;
        });

        // Close the form and stay in the current view on successful update
        if (statusCode == 200) {
          Future.delayed(Duration(seconds: 1), () {
            widget.onClose
                ?.call(); // Call the onClose callback to return to the parent view
          });
        }
      } catch (e) {
        print(e);
        setState(() {
          _isProcessing = false;
          _message = 'An error occurred while updating the account.';
          _messageColor = Colors.red;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadAccountData();
    _passwordController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Account'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: widget.onClose, // Handle close button
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
                      _fullNameController, 'Full Name', TextInputType.text),
                  _buildTextField(
                      _emailController, 'Email', TextInputType.emailAddress),
                  _buildTextField(_phoneNumberController, 'Phone Number',
                      TextInputType.phone),
                  _buildTextField(
                      _addressController, 'Address', TextInputType.text),
                  _buildTextField(
                      _passwordController, 'Password', TextInputType.text),
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
                            'Update',
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
