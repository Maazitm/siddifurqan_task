import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CustomerRegistrationScreen extends StatefulWidget {
  @override
  _CustomerRegistrationScreenState createState() =>
      _CustomerRegistrationScreenState();
}

class _CustomerRegistrationScreenState
    extends State<CustomerRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  late String name,
      contactNumber,
      email,
      pinCode,
      state = '',
      city = '',
      address,
      password;
  XFile? addressProof;
  bool isAddressProofSelected = false;
  bool isLoading = false;

  Future<void> _getAddressFromPinCode(String pinCode) async {
    if (pinCode.length == 6) {
      setState(() {
        isLoading = true;
      });

      try {
        final response = await http
            .get(Uri.parse('http://postalpincode.in/api/pincode/$pinCode'));
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data['Status'] == 'Success') {
            setState(() {
              city = data['PostOffice'][0]['District'];
              state = data['PostOffice'][0]['State'];
            });
          } else {
            setState(() {
              city = '';
              state = '';
            });
            _showErrorDialog('Invalid PIN code. Please try again.');
          }
        } else {
          _showErrorDialog('Failed to fetch data. Please try again later.');
        }
      } catch (e) {
        print('Error: $e');
        _showErrorDialog(
            'Failed to fetch data. Please check your internet connection.');
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _registerCustomer() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          isLoading = true;
        });

        final newUser = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        await _firestore.collection('customers').doc(newUser.user!.uid).set({
          'name': name,
          'contactNumber': contactNumber,
          'email': email,
          'pinCode': pinCode,
          'state': state,
          'city': city,
          'address': address,
          'addressProof': addressProof?.path,
        });

        Navigator.pushNamed(context, '/login'); // Navigate to login screen
      } catch (e) {
        print(e);
        _showErrorDialog('Registration failed. Please try again later.');
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Customer Registration')),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your name' : null,
                    onChanged: (value) => name = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Contact Number'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your contact number' : null,
                    onChanged: (value) => contactNumber = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your email' : null,
                    onChanged: (value) => email = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Pin Code'),
                    validator: (value) =>
                        value!.length != 6 ? 'Enter a 6-digit pin code' : null,
                    onChanged: (value) {
                      pinCode = value;
                      if (pinCode.length == 6) {
                        _getAddressFromPinCode(pinCode);
                      } else {
                        setState(() {
                          city = '';
                          state = '';
                        });
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'State'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your state' : null,
                    onChanged: (value) => state = value,
                    initialValue: state,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'City'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your city' : null,
                    onChanged: (value) => city = value,
                    initialValue: city,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Address'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your address' : null,
                    onChanged: (value) => address = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your password' : null,
                    onChanged: (value) => password = value,
                    obscureText: true,
                  ),
                  TextButton.icon(
                    icon: Icon(Icons.image),
                    label: Text('Upload Address Proof'),
                    onPressed: () async {
                      final pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      setState(() {
                        addressProof = pickedFile;
                        isAddressProofSelected = true;
                      });
                    },
                  ),
                  ElevatedButton(
                    onPressed: _registerCustomer,
                    child: Text('Register'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, '/login'); // Navigate to login screen
                    },
                    child: Text('Already have an account? Login'),
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
