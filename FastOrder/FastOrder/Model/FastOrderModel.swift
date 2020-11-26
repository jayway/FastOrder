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
        UserDefaults.standard.set(try? PropertyListEncoder().encode(user), forKey: "user-profile")
    }
    
    mutating func loadUser() {
        if let data = UserDefaults.standard.value(forKey: "user-profile") as? Data {
            if let user = try? PropertyListDecoder().decode(UserProfile.self, from: data) {
                self.user = user
            }
        }
    }
    
    mutating func clearUser() {
        UserDefaults.standard.removeObject(forKey: "user-profile")
        self.user = UserProfile()
    }
}
