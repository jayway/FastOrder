//
//  OnboardingViewModel.swift
//  FastOrder
//
//  Created by Claus Simonsen on 23/11/2020.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    @Published private var fastOrderModel: FastOrderModel = FastOrderModel()

    @Published var user = UserProfile()

    
    // MARK: - Intent(s)
    
    func reserve() {
        self.fastOrderModel.persistUser(user: user)
    }

    func loadUser() {
        self.fastOrderModel.loadUser()
        self.user = self.fastOrderModel.user
    }
    
    func clearUser() {
        self.fastOrderModel.clearUser()
        self.user = self.fastOrderModel.user
    }
    
    
    // MARK: - Access the model
    
}
