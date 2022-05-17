//
//  CompleteProfileModel.swift
//  KKGroupDemo
//
//  Created by James Sinclair on 2022/05/16.
//

import Foundation

protocol CompleteProfileModelProtocol: AnyObject {
    func completeProfile() async -> CompleteProfileModel?
}

class ConcreteCompleteProfileModel: CompleteProfileModelProtocol {
    private let path = "https://eu-west-1.aws.data.mongodb-api.com/app/chatreward-kytrn/endpoint/hello"

    func completeProfile() async -> CompleteProfileModel? {
        guard let url = URL(string: path) else {
            return nil
        }

        var model: CompleteProfileModel?

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            model = try? JSONDecoder().decode(CompleteProfileModel.self, from: data)
        } catch {
            print("Profile completion failed: \(error.localizedDescription)")
        }

        return model
    }
}

class MockCompleteProfileModel: CompleteProfileModelProtocol {
    // set this on or off to simulate potential errors or scenarios
    var emptyModel = false
    var emptyData = false
    var success = true
    var testTitle = "Test Title"
    var testMessage = "Test message"

    func completeProfile() async -> CompleteProfileModel? {
        if emptyModel {
            return nil
        } else {
            let model = CompleteProfileModel(success: success,
                                             data: emptyData ? nil : CompleteProfileDataModel(title: testTitle,
                                                                                              message: testMessage))
            return model
        }
    }
}
