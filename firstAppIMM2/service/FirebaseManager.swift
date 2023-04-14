//
//  FirebaseManager.swift
//  firstAppIMM2
//
//  Created by Djino Dissingar on 14/04/2023.
//

import Foundation
import Firebase

class FirebaseManager {
    //classe qui gère les opérations sur Firebase
    
    //attributs
    var auth : Auth
    var cloudFirestore : Firestore
    static let shared = FirebaseManager()
    
    //variable calculé
    var userRef : CollectionReference {
        return cloudFirestore.collection("UTILISATEURS")
    }
    
    
    init(){
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        auth = Auth.auth()
        cloudFirestore = Firestore.firestore()
    }
    
    
    
    
    
    
    //Les méthodes
    //creer un utilisateur
    func addUser(uid : String , datas: [String : Any]){
        userRef.document(uid).setData(datas)
    }
    
    
    //mettre à  jour les infos de l'utilisateur
    func updateUser(uid : String , datas: [String : Any]){
        userRef.document(uid).updateData(datas)
    }
    
    
    //déconnection
    
    
    
}
