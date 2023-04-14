//
//  ContentView.swift
//  firstAppIMM2
//
//  Created by Djino Dissingar on 12/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State var isPresent = false
    @StateObject var authVM : AuthViewModel = AuthViewModel()
    var body: some View {
        if(authVM.isFinishConnecting){
            if(authVM.isAuth){
                Text("Dashboard")
            }
            else
            {
                VStack {
                    HStack {
                        Image("chainsaw")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                        .frame(width: 150,height: 150)
                        .padding()
                        Text("Chainsaw Man")
                            .bold()
                            .foregroundColor(.red)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    
                    .background(.gray)
                    .cornerRadius(25)
                    .padding()
                    
                    
                    
                    Spacer()
                    
                    Button("Valider") {
                        //action
                        self.isPresent.toggle()
                        
                    }
                    Spacer()
                }
                .background(
                    Image("cowboy")
                        .resizable()
                        .ignoresSafeArea(.all)
                )
                .sheet(isPresented: $isPresent) {
                    RegisterPage(authVM: authVM)
                }
            }
            
        }
        else
        {
           Text("En cours de connexion ...")
        }
        
        
        
        

        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
