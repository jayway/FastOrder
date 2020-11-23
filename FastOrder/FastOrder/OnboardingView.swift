//
//  OnboardingView.swift
//  FastOrder
//
//  Created by Mina Ashna on 18/11/2020.
//

import SwiftUI

struct OnboardingView: View {
    @State var name: String = ""
    @State var phoneNumber: String = ""
    
    var body: some View {
        VStack {
            Image("Onboarding_PlaceHolder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            TextField("Name", text: $name)
                .bordered()
                .padding()
            
            TextField("Phone Number", text: $phoneNumber)
                .bordered()
                .padding()
            
            Button(action: self.reserve) {
                Text("Reserve")
                    .font(.body)
                    .bold()
            }
            .bordered()
            .padding()
        }
    }
}


// TODO: Event Handlers should likely be moved to ViewModel where they can be referred to as 'Intents' (Stanford CS193p 2020)
// MARK: - Event Handlers

extension OnboardingView {
    func reserve() {
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
