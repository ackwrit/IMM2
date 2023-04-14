//
//  Personne.swift
//  firstAppIMM2
//
//  Created by Djino Dissingar on 14/04/2023.
//

import Foundation
import SwiftUI

struct Personne : Identifiable{
    var id : String
    var _mail : String?
    var _nom : String?
    var _prenom : String?
    
    
    var mail : String {
        return _mail ?? ""
    }
    
    var nom : String {
        return _nom ?? ""
    }
    
    var prenom : String {
        return _prenom ?? ""
    }
    
    var nomComplet : String {
        return prenom + " " + nom
    }
    
    
    init(id: String , datas:[String : Any]){
        self.id = id
        self._nom = datas["NOM"] as? String
        self._prenom = datas["PRENOM"] as? String
        self._mail = datas["MAIL"] as? String
        
    }
}
