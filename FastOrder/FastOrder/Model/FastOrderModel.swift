//
//  FastOrderModel.swift
//  FastOrderModel
//
//  Created by Claus Simonsen on 25/11/2020.
//

import Foundation

struct FastOrderModel {
    var user: UserProfile
    
    init() {
        self.user = UserProfile()
    }

    func persistUser(user: UserProfile) {
        print("Attempting Persistance of User Profile")
    }
