//
//  RegisterPage.swift
//  firstAppIMM2
//
//  Created by Djino Dissingar on 14/04/2023.
//

import SwiftUI

struct RegisterPage: View {
    @StateObject var authVM : AuthViewModel
    @State var mail = ""
    @State var password = ""
    @State var prenom = ""
    @State var nom = ""
    var body: some View {
        VStack{
            TextField("Entrer votre prénom", text: $prenom)
                .textFieldStyle(.roundedBorder)
            
            TextField("Entrer votre nom", text: $nom)
                .textFieldStyle(.roundedBorder)
            TextField("Entrer votre mail", text: $mail)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Entrer votre mot de passe", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button("Inscription") {
                authVM.CreateUser(mail: mail, password: password, prenom: prenom, nom: nom)
            }
        }
        .padding(.all,10)
    }
}


