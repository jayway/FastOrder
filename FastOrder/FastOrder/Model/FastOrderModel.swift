//
//  FastOrderModel.swift
//  FastOrderModel
//
//  Created by Claus Simonsen on 25/11/2020.
//

import Foundation

struct FastOrderModel {
    var user: UserProfile
    
    enum PersistanceKeys: String {
        case userProfile = "user-profile"
    }
    
    init() {
        self.user = UserProfile()
    }
    
    func persistUser(user: UserProfile) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(user), forKey: PersistanceKeys.userProfile.rawValue)
    }
    
    mutating func loadUser() {
        guard let data = UserDefaults.standard.value(forKey: PersistanceKeys.userProfile.rawValue) as? Data else { return }
        
        if let user = try? PropertyListDecoder().decode(UserProfile.self, from: data) {
            self.user = user
        }
    }
    
    mutating func clearUser() {
        UserDefaults.standard.removeObject(forKey: PersistanceKeys.userProfile.rawValue)
        self.user = UserProfile()
    }
}
