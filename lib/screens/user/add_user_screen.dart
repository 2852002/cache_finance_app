import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../widgets/custom_button.dart';

class AddUserScreen extends StatefulWidget {
  final Function(Map<String, String>) addUserCallback;

  const AddUserScreen({super.key, required this.addUserCallback});

  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _paidDuesController = TextEditingController();
  final TextEditingController _unpaidDuesController = TextEditingController();
  final TextEditingController _duesHistoryController = TextEditingController();
  final TextEditingController _planDetailsController = TextEditingController();

  void _addUser() {
    Map<String, String> newUser = {
      'name': _nameController.text,
      'address': _addressController.text,
      'contact': _contactController.text,
      'paidDues': _paidDuesController.text,
      'unpaidDues': _unpaidDuesController.text,
      'duesHistory': _duesHistoryController.text,
      'planDetails': _planDetailsController.text,
    };

    widget.addUserCallback(newUser);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const BackButton(),
        title: Text('Add User', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildTextField('Name', _nameController),
                _buildTextField('Address', _addressController),
                _buildTextField(
                  'Contact',
                  _contactController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                _buildTextField('Paid Dues', _paidDuesController),
                _buildTextField('Unpaid Dues', _unpaidDuesController),
                _buildTextField('Dues History', _duesHistoryController),
                _buildTextField('Plan Details', _planDetailsController),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                child: CustomButton(
                  text: 'Add User',
                  onPressed: _addUser,
                  buttonColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text,
      List<TextInputFormatter>? inputFormatters}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
        ),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: 'Enter $labelText',
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white54),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Theme.of(context)
                          .inputDecorationTheme
                          .enabledBorder
                          ?.borderSide
                          .color ??
                      Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Theme.of(context)
                          .inputDecorationTheme
                          .focusedBorder
                          ?.borderSide
                          .color ??
                      Colors.grey),
            ),
            fillColor: Colors.transparent,
          ),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
