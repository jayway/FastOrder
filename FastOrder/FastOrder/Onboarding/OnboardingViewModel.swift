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

    // MARK: - Access the model
    
}
