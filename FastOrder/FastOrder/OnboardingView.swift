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
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.blue)
                )
                .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 1, y: 2)
                .padding()
            
            TextField("Phone Number", text: $phoneNumber)
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.blue)
                )
                .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 1, y: 2)
                .padding()

            Button(action: self.reserve) {
                Text("Reserve")
                    .font(.body)
                    .bold()
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
            )
            .shadow(color: Color.gray.opacity(0.5), radius: 3, x: 1, y: 2)
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
