import 'package:flutter/material.dart';

Widget buildTextFormField(String label, FormFieldSetter<String> onSaved,
    {TextInputType keyboardType = TextInputType.text}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
    ),
    keyboardType: keyboardType,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your $label';
      }
      return null;
    },
    onSaved: onSaved,
  );
}

Widget buildDropdownFormField(
    String label, List<String> items, FormFieldSetter<String> onSaved) {
  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
    ),
    value: items.first,
    items: items.map((place) {
      return DropdownMenuItem(
        value: place,
        child: Text(place),
      );
    }).toList(),
    onChanged: (value) {
      // Perform any action on dropdown selection if needed
    },
    onSaved: onSaved,
    validator: (value) {
      if (value == items.first) {
        return 'Please select your $label';
      }
      return null;
    },
  );
}

Widget buildDateFormField(
  String label,
  DateTime? selectedDate,
  FormFieldSetter<DateTime> onSaved,
  BuildContext context, // Add BuildContext as a parameter
) {
  return TextFormField(
    readOnly: true,
    decoration: InputDecoration(
      labelText: label,
      hintText: 'DD/MM/YYYY',
      suffixIcon: const Icon(Icons.calendar_today),
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
    ),
    onTap: () async {
      DateTime? date = await showDatePicker(
        context: context, // Use the context passed to the function
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );
      if (date != null) {
        onSaved(date);
      }
    },
    controller: TextEditingController(
      text: selectedDate != null
          ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
          : '',
    ),
    validator: (value) {
      if (selectedDate == null) {
        return 'Please select your date of birth';
      }
      return null;
    },
  );
}

Widget buildPasswordFormField({
  required TextEditingController controller,
  required String label,
  required bool isConfirm,
  required bool isVisible,
  required VoidCallback toggleVisibility,
}) {
  return TextFormField(
    controller: controller,
    obscureText: !isVisible,
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 2.0),
      ),
      prefixIcon: const Icon(Icons.lock),
      suffixIcon: IconButton(
        icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: toggleVisibility,
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your $label';
      }
      return null;
    },
  );
}
