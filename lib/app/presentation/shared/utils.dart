import 'dart:io';

import 'package:autentification/app/presentation/shared/firebase_util.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1).toLowerCase();
}

Future<void> pickAndUploadImage(String userId) async {
  try {
    // Permitir al usuario seleccionar una imagen desde la galería
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) {
      debugPrint("No se seleccionó ninguna imagen.");
      return; // Si el usuario no selecciona una imagen, salir de la función
    }

    // Subir la imagen seleccionada a Firebase Storage
    final storageRef =
        FirebaseStorage.instance.ref().child('profile_images/$userId.jpg');
    final uploadTask = storageRef.putFile(File(pickedFile.path));
    final snapshot = await uploadTask;
    final downloadUrl = await snapshot.ref.getDownloadURL();

    // Guardar la URL de la imagen en Firestore
    await saveImageToFirestore(userId, downloadUrl);

    debugPrint("Imagen subida y guardada correctamente: $downloadUrl");
  } catch (e) {
    debugPrint("Error al subir la imagen: $e");
  }
}
