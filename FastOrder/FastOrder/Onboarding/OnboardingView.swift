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
                .bordered()
                .padding()
            
            Button(action: self.viewModel.reserve) {
                Text("Reserve")
                    .font(.body)
                    .bold()
            }
            .bordered()
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel())
    }
}
