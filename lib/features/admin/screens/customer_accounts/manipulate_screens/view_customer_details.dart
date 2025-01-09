import 'package:flutter/material.dart';

class ViewAccountDetails extends StatelessWidget {
  final Map<String, dynamic> accountDetails;
  final VoidCallback onClose;

  ViewAccountDetails({required this.accountDetails, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: onClose, // Handle close button
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            width: isLargeScreen ? 600 : double.infinity,
            child: ListView(
              children: [
                _buildDetailRow('Account ID', accountDetails['accountId'].toString()),
                _buildDetailRow('Full Name', accountDetails['fullName']),
                _buildDetailRow('Email', accountDetails['email']),
                _buildDetailRow('Phone Number', accountDetails['phoneNumber']),
                _buildDetailRow('Address', accountDetails['address']),
                _buildDetailRow('Status', accountDetails['status']),
                _buildDetailRow('Balance', accountDetails['balance'].toString()),
                SizedBox(height: 20),
              
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
