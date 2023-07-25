//Importando librerias necesarias
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

//Creacion de la clase que nos ayudara a hacer la autenticacion
class Authenticator {
  /*Los metodos que se utilizan para el inicio de sesion son asincronos al proyecto y se debe
  esperar a que se completen nuestros metodos*/
  static Future<User?> iniciarSesion(BuildContext context) async {
    /*Este metodo crea un objeto con funciones que nos ayudaran a lograr la autenticacion de nuestras
    credenciales*/
    FirebaseAuth authenticator = FirebaseAuth.instance;
    User? user;
//Un objeto de tipo signIn que nos ayudara con el inicio de sesion.
    GoogleSignIn objGoogleSignIn = GoogleSignIn();
/*Objeto que guarda los datos de la cuenta de inicio de sesion que llama al objeto SignIn y su metodo
inicio de sesion*/
    GoogleSignInAccount? objGoogleSignInAccount =
        await objGoogleSignIn.signIn();
/*Validamos que la cuenta de inicio de sesion de google no sea nula y creamos
credenciales para el usuario*/
    if (objGoogleSignInAccount != null) {
      GoogleSignInAuthentication objGoogleSignInAuthentication =
          await objGoogleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: objGoogleSignInAuthentication.accessToken,
          idToken: objGoogleSignInAuthentication.idToken);
      try {
        UserCredential userCredential =
            await authenticator.signInWithCredential(credential);

        user = userCredential.user;
        return user;
      } on FirebaseAuthException catch (e) {
        print("Error en la autenticacion" + e.toString());
      }
    }
  }
}
