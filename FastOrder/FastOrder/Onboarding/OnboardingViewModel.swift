//
//  OnboardingViewModel.swift
//  FastOrder
//
//  Created by Claus Simonsen on 23/11/2020.
//

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    @Published private var fastOrderModel: FastOrderModel = FastOrderModel()

    @Published var user = UserProfile()
    @Published var fastOrderReservation: FastOrderQueueReservationResponse = FastOrderQueueReservationResponse(id: "", slug: "")
    
    private let fastOrderFetcher = FastOrderFetcher()
    private var cancellable = Set<AnyCancellable>()
    
    
    // MARK: - Intent(s)
    
    func reserve() {
        self.fastOrderModel.persistUser(user: user)
        
        fastOrderFetcher.queueNumberReservation(forName: user.name, phoneNumber: user.phoneNumber)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { value in
                    switch value {
                    case .failure:
                        break
                    case .finished:
                        break
                    }
            },
                receiveValue: { [weak self] reservation in
                    guard let self = self else { return }
                    self.fastOrderReservation = reservation
            })
            .store(in: &cancellable)
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
