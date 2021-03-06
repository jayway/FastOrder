//
//  OnboardingView.swift
//  FastOrder
//
//  Created by Mina Ashna on 18/11/2020.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Image("Onboarding_PlaceHolder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            TextField("Name", text: $viewModel.user.name)
                .bordered()
                .padding()
            
            TextField("Phone Number", text: $viewModel.user.phoneNumber)
                .keyboardType(.phonePad)
                .bordered()
                .padding()
            
            Button(action: self.viewModel.reserve) {
                Text("Reserve")
                    .font(.body)
                    .bold()
            }
            .bordered()
            .padding()
            
            Text("FastOrder Reservation ID")
                .font(.body)
                .bold()
            
            Text(viewModel.fastOrderReservation.id)
                .font(.body)
                .bold()
                .bordered()
            
            Text("FastOrder Reservatiion slug")
                .font(.body)
                .bold()
            
            Text(viewModel.fastOrderReservation.slug)
                .font(.body)
                .bold()
                .bordered()
            
            // TODO: For now Reload User is primarily for investigation purposes
            Button(action: self.viewModel.loadUser) {
                Text("Reload User")
                    .font(.body)
                    .bold()
            }
            .bordered()
            .padding()
            
            // TODO: For now Clear User is primarily for investigation purposes
            Button(action: self.viewModel.clearUser) {
                Text("Clear User")
                    .font(.body)
                    .bold()
            }
            .bordered()
        }
        .onAppear(perform: {
            self.viewModel.loadUser()
        })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel())
    }
}
