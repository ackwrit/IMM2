//
//  AuthViewModel.swift
//  firstAppIMM2
//
//  Created by Djino Dissingar on 14/04/2023.
//

import Foundation
import Firebase

class AuthViewModel : ObservableObject {
    @Published var isAuth : Bool = false
    @Published var isFinishConnecting : Bool = false
    
}
