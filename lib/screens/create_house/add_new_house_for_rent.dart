import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:rent_house/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNewHouseForRent extends StatefulWidget {
  @override
  _AddNewHouseForRentState createState() => _AddNewHouseForRentState();
}

class _AddNewHouseForRentState extends State<AddNewHouseForRent> {
  File? _imageFile;

  List<File?> _imagesFile = List<File?>.filled(8, null);

  final picker = ImagePicker();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  int maxImages=8;
  int selectedImage=0;
  int availableRent=0;
  bool selectedStudent=false;
  bool selectedWorker=false;
  bool selectedFamily=false;


  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickImages(int position) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagesFile[position] = File(pickedFile.path);
      });
    }
  }

  /*
  Future<String?> _uploadImage(File? imageFile) async {
    if (imageFile != null) {
      final storage = FirebaseFirestore.instance;
      final ref = storage.ref().child('images/${DateTime.now()}.jpg');
      final metadata = SettableMetadata(contentType: 'image/jpeg');
      final uploadTask = ref.putFile(imageFile, metadata);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    }
    return null;
  }

  Future<void> _saveImageToFirebase() async {
    final imageUrl = await _uploadImage(_imageFile);
    if (imageUrl != null) {
      // Save the image URL to Firebase Firestore or any other desired storage
      // e.g., FirebaseFirestore.instance.collection('images').doc().set({'imageUrl': imageUrl});
      print('Image URL: $imageUrl');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _priceController = TextEditingController();
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: whiteColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(left: 20, top: 30,right: 20),
                child :Text(
                    "Aggiungi le informazioni principali:",
                    style: secondaryTitle,
                  ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Titolo:',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Città',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _priceController,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                            labelText: 'Prezzo',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20,),
                        Text(
                            "Posizione:",
                            style: secondaryTitle,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _priceController,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                            labelText: 'Prezzo',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _priceController,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                            labelText: 'Via',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Text(
                          "Dettagli:",
                          style: secondaryTitle,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          maxLines: null,
                          controller: _nameController,
                          //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          decoration: InputDecoration(
                            labelText: 'Descrizione',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 30.0),
                        Text(
                          "Componenti appartamento:",
                          style: secondaryTitle,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.kitchen_outlined,
                                    size: 16,
                                  ),
                                  Text("Kitchen")
                                ],
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.bathtub_outlined,
                                    size: 16,
                                  ),
                                  Text("Bathroom")
                                ],
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.bedroom_parent_rounded,
                                    size: 16,
                                  ),
                                  Text("Bedroom")
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child:TextFormField(
                                maxLines: null,
                                controller: _nameController,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              )
                            ),
                            Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:TextFormField(
                                  maxLines: null,
                                  controller: _nameController,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                )
                            ),
                            Container(
                                height: 50,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:TextFormField(
                                  maxLines: null,
                                  controller: _nameController,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                )
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Affiti a:",
                          style: secondaryTitle,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  child: Text("Student"),
                                  onPressed: () {
                                    setState(() {
                                      if(selectedStudent)
                                        selectedStudent=false;
                                      else
                                        selectedStudent=true;
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: selectedStudent
                                        ? MaterialStateProperty.all<Color>(Colors.green)
                                        : MaterialStateProperty.all<Color>(Colors.red),
                                  ),
                                ),
                              ElevatedButton(
                                child: Text("Worker"),
                                onPressed: () {
                                  setState(() {
                                    if(selectedWorker)
                                      selectedWorker=false;
                                    else
                                      selectedWorker=true;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: selectedWorker
                                      ? MaterialStateProperty.all<Color>(Colors.green)
                                      : MaterialStateProperty.all<Color>(Colors.red),
                                ),
                              ),
                              ElevatedButton(
                                child: Text("Family"),
                                onPressed: () {
                                  setState(() {
                                    if(selectedFamily)
                                      selectedFamily=false;
                                    else
                                      selectedFamily=true;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor: selectedFamily
                                      ? MaterialStateProperty.all<Color>(Colors.green)
                                      : MaterialStateProperty.all<Color>(Colors.red),
                                ),
                              )
                            ]
                          //Text('Seleziona l\'orario'),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Carica immagine ( 8 max ) :",
                          style: secondaryTitle,
                        ),
                        Container(
                            height: 350,
                            //onPressed: _selectTime,
                            child: GridView.builder(
                              itemCount: maxImages,
                              itemBuilder: (context, index) {
                                return ElevatedButton(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      if (_imagesFile[index] != null)
                                        Container(
                                          height: 109,
                                          child: Image.file(
                                            _imagesFile[index]!,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                    ],
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedImage = index;
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: selectedImage==index ? MaterialStateProperty.all<Color>(greyColor)
                                        : MaterialStateProperty.all<Color>(Colors.blueGrey),
                                  ),
                                );
                              },
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // Numero di colonne desiderate
                                crossAxisSpacing: 8.0, // Spaziatura orizzontale tra i pulsanti
                                mainAxisSpacing: 8.0, // Spaziatura verticale tra i pulsanti
                              ),
                            )
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await _pickImages(selectedImage);
                            // Rest of your code
                          },
                          child: Text('Choose Image'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                          },
                          child: Text('Submit'),
                        ),
                      ],
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
     /*Scaffold(
      appBar: AppBar(
        title: Text('Image Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_imageFile != null)
              Image.file(
                _imageFile!,
                height: 200,
              ),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Choose Image'),
            ),
            ElevatedButton(
              //onPressed: (),
              onPressed: () {  },
              child: Text('Upload and Save Image'),
            ),
          ],
        ),
      ),
    );*/
  }
}