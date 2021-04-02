import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFields2Example extends StatefulWidget {
  @override
  _TextFields2ExampleState createState() => _TextFields2ExampleState();
}

class _TextFields2ExampleState extends State<TextFields2Example> {
  final _firstNameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _passwordController = TextEditingController();

  final _firstNameFocusNode = FocusNode();
  final _surnameFocusNode = FocusNode();
  final _phoneNumberFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _firstNameFocusNode.dispose();
    _surnameFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _passwordFocusNode.dispose();
    _firstNameController.dispose();
    _surnameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Fields"),
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.all(16),
        children: [
          _buildFirstNameField(_firstNameFocusNode, _surnameFocusNode),
          _buildLastNameNameField(_surnameFocusNode, _phoneNumberFocusNode),
          _buildPhoneField(_phoneNumberFocusNode, _passwordFocusNode),
          _buildPasswordField(_passwordFocusNode, null),
        ],
      ),
    );
  }

  Widget _buildFirstNameField(FocusNode node, FocusNode nextFocus) {
    return TextField(
      decoration: InputDecoration(labelText: "First name"),
      focusNode: node,
      controller: _firstNameController,
      onSubmitted: (_) => nextFocus.requestFocus(),
      textInputAction: TextInputAction.next,
      autofillHints: [AutofillHints.name],
      keyboardType: TextInputType.name,
    );
  }

  Widget _buildLastNameNameField(FocusNode node, FocusNode nextFocus) {
    return TextField(
      decoration: InputDecoration(labelText: "Last name"),
      focusNode: node,
      controller: _surnameController,
      onSubmitted: (_) => nextFocus.requestFocus(),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-z,A-Z]'))
      ],
      textInputAction: TextInputAction.next,
      autofillHints: [AutofillHints.familyName],
    );
  }

  Widget _buildPhoneField(FocusNode node, FocusNode nextFocus) {
    return TextField(
      focusNode: node,
      controller: _phoneNumberController,
      onChanged: (value) {
        if (value.length == 10) nextFocus.requestFocus();
      },
      onSubmitted: (_) => nextFocus.requestFocus(),
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        TextInputFormatter.withFunction((oldValue, newValue) {
          if (newValue.text.contains('6')) {
            return newValue.copyWith(text: newValue.text.replaceAll('6', '*'));
          }
          return newValue;
        })
      ],
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixText: '+7',
        labelText: "Phone",
      ),
      autofillHints: [AutofillHints.name],
      keyboardType: TextInputType.phone,
    );
  }

  Widget _buildPasswordField(FocusNode node, FocusNode? nextFocus) {
    return TextField(
      decoration: InputDecoration(labelText: "Password"),
      focusNode: node,
      controller: _passwordController,
      onSubmitted: (value) => node.unfocus(),
      textInputAction: TextInputAction.done,
      obscuringCharacter: '*',
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
