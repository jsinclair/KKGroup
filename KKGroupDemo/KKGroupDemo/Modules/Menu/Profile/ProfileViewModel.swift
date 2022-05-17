//
//  ProfileViewModel.swift
//  KKGroupDemo
//
//  Created by James Sinclair on 2022/05/16.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var profilePicBorderColor = Color.red
    @Published var doItButtonGradientColors = [Color("DarkBlue"), Color("LightBlue")]
    @Published var title = "Complete your profile"
    @Published var message = "Take a few steps to show the kommunity who you really are"
    @Published var buttonText = "Let's get it done"

    private let model: CompleteProfileModelProtocol

    init(model: CompleteProfileModelProtocol) {
        self.model = model
    }

    @MainActor
    func completeProfle() async {
        if let model = await model.completeProfile(), model.success {
            self.profilePicBorderColor = Color("DarkGreen")
            self.doItButtonGradientColors = [Color("DarkGreen"), Color("LightGreen")]
            self.title = model.data?.title ?? "No title returned"
            self.message = model.data?.message ?? "No message returned"
            self.buttonText = "Success!"

        } else {
            self.setErrorValues()
        }
    }

    private func setDefaultValues() {
        profilePicBorderColor = Color.red
        doItButtonGradientColors = [Color("DarkBlue"), Color("LightBlue")]
        title = "Complete your profile"
        message = "Take a few steps to show the kommunity who you really are"
        buttonText = "Let's get it done"
    }

    private func setErrorValues() {
        profilePicBorderColor = Color.red
        doItButtonGradientColors = [Color("DarkRed"), Color("LightRed")]
        title = "Error completing profile"
        message = "We were unable to complete your profile"
        buttonText = "Try again?"
    }
}
