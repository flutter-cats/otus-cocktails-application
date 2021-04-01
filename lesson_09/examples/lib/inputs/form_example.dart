import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormExample extends StatefulWidget {
  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _firstNameController = TextEditingController();
  final _firstNameFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool _isChecked = false;

  dispose() {
    _firstNameController.dispose();
    _firstNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Validation"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildFirstNameField(),
            const SizedBox(height: 24),
            _buildCheckbox(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _validateAndSubmit,
              child: Text('Готово'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstNameField() {
    return TextFormField(
      focusNode: _firstNameFocusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _firstNameController,
      validator: _emptyValidator,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(labelText: 'Имя'),
      autofillHints: [AutofillHints.name],
      keyboardType: TextInputType.name,
    );
  }

  Widget _buildCheckbox() {
    return FormField<bool>(
      validator: (value) {
        if (value != true) return 'Нужно обязательно со всем согласиться';
        return null;
      },
      initialValue: _isChecked,
      builder: (state) {
        return CheckboxListTile(
          value: _isChecked,
          title: Text('На все согласен'),
          subtitle: state.hasError
              ? Text(
                  state.errorText ?? '',
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                )
              : null,
          onChanged: (value) {
            setState(() {
              _isChecked = value ?? false;
              state.didChange(_isChecked);
              state.validate();
            });
          },
        );
      },
    );
  }

  void _validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      print('Success!');
    } else {
      print('Failure!');
    }
  }

  String? _emptyValidator(String? value) {
    if (value?.isNotEmpty != true) {
      //возвращаем текст ошибки
      return 'Поле обязательно';
    }
    //null означает что ошибок нет
    return null;
  }
}
