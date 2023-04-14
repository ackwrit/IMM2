//
//  RegisterPage.swift
//  firstAppIMM2
//
//  Created by Djino Dissingar on 14/04/2023.
//

import SwiftUI

struct RegisterPage: View {
    @State var mail = ""
    @State var password = ""
    var body: some View {
        VStack{
            TextField("Entrer votre mail", text: $mail)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Entrer votre mot de passe", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button("Inscription") {
                //
            }
        }
        .padding(.all,10)
    }
}

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}
