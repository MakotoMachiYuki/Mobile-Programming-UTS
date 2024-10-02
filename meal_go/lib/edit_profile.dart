import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController firstNameController =
      TextEditingController(text: 'Allison');
  final TextEditingController lastNameController =
      TextEditingController(text: 'Brie');
  final TextEditingController addressController = TextEditingController(
      text: 'Jl. Pinus No. 12, Jakarta Barat\nDKI Jakarta');
  final TextEditingController phoneController =
      TextEditingController(text: '081235467888');
  final TextEditingController emailController =
      TextEditingController(text: 'Abby.brie@gmail.com');
  final TextEditingController bioController =
      TextEditingController(text: 'Haii, ini Abby!');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEditableRow('First Name', firstNameController),
            _buildEditableRow('Last Name', lastNameController),
            _buildEditableRow('Address', addressController),
            _buildEditableRow('Phone', phoneController),
            _buildEditableRow('Email', emailController),
            _buildEditableRow('Bio', bioController),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableRow(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              '$label :',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 7,
            child: TextField(
              controller: controller,
              maxLines: label == 'Address' || label == 'Bio' ? 2 : 1,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(bottom: 4),
                border: UnderlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
