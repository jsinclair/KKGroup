//
//  ProfileModels.swift
//  KKGroupDemo
//
//  Created by James Sinclair on 2022/05/16.
//

import Foundation

struct CompleteProfileModel: Decodable {
    let success: Bool
    let data: CompleteProfileDataModel?
}

struct CompleteProfileDataModel: Decodable {
    let title: String
    let message: String
}
