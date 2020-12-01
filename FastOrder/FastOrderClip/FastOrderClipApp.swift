//
//  FastOrderClipApp.swift
//  FastOrderClip
//
//  Created by Mina Ashna on 18/11/2020.
//

import SwiftUI

@main
struct FastOrderClipApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView(viewModel: OnboardingViewModel())
        }
    }
}
