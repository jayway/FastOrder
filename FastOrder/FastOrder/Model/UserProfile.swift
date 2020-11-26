//
//  UserProfile.swift
//  FastOrder
//
//  Created by Claus Simonsen on 25/11/2020.
//

import Foundation

struct UserProfile: Codable {
    var name: String
    
    // TODO: Maybe we need to consider phone number formatting and/or validation
    var phoneNumber: String
    
    init() {
        self.name = ""
        self.phoneNumber = ""
    }
}
