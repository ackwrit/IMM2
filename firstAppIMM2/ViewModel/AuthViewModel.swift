//
//  AuthViewModel.swift
//  firstAppIMM2
//
//  Created by Djino Dissingar on 14/04/2023.
//

import Foundation
import Firebase

class AuthViewModel : ObservableObject {
    //attributs
    var manager = FirebaseManager.shared
    @Published var isAuth : Bool = false
    @Published var isFinishConnecting : Bool = false
    @Published var showError : Bool = false
    var errorString = ""
    var datas: [String: Any] = [:]
    
    //varaibale calculé
    var auth : Auth {
        return manager.auth
    }
    
    
    //constructeur
    init(){
        observeAuthentification()
    }
    
    
    
    func observeAuthentification(){
        //observer si la personnes s'est déja connecté ou pas
        auth.addStateDidChangeListener(handleListner)
        
    }
    
    func handleListner(auth : Auth, user : User?){
        self.isFinishConnecting = true
        self.isAuth = user != nil
        
    }
    
    func CreateUser(mail : String , password : String, prenom : String, nom : String){
        guard checkValue(mail, value: "mail") else {return }
        guard checkValue(password, value: "password") else {return }
        guard checkValue(prenom, value: "prénom") else {return }
        guard checkValue(nom, value: "nom") else {return }
        self.datas = ["MAIL": mail,"PRENOM":prenom,"NOM":nom]
        auth.createUser(withEmail: mail, password: password,completion: autoCompletion)
        
        
        
    }
    
    
    func autoCompletion(dataResult : AuthDataResult?,error : Error?){
        if let errorLocal  = error {
            self.errorString = errorLocal.localizedDescription
            self.showError = true
            return
        }
        
        if let datas = dataResult {
            let user = datas.user
            let uid = user.uid
            FirebaseManager().addUser(uid: uid, datas: self.datas)
            
        }
    }
    
    func checkValue(_ variable : String , value : String) -> Bool{
        let isEmpty = variable != ""
        self.showError  = !isEmpty
        self.errorString = !isEmpty ? "Entrer votre \(value)" : ""
        return isEmpty
        
    }
    
    
    
}
