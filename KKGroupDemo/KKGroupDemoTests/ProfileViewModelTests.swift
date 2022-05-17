//
//  ProfileViewModelTests.swift
//  KKGroupDemoTests
//
//  Created by James Sinclair on 2022/05/17.
//

import XCTest
import SwiftUI
@testable import KKGroupDemo

class ProfileViewModelTests: XCTestCase {

    var model: MockCompleteProfileModel!
    var viewModel: ProfileViewModel!

    override func setUpWithError() throws {
        model = MockCompleteProfileModel()
        viewModel = ProfileViewModel(model: model)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        model = nil
    }

    func testInitialState() {
        // given
        // Nothing really, just checking that the view model starts off with the right stuff

        // when
        // Again, testing starting values, so nothing has happened yet

        // then
        XCTAssertEqual(viewModel.profilePicBorderColor, Color.red)
        XCTAssertEqual(viewModel.doItButtonGradientColors, [Color("DarkBlue"), Color("LightBlue")])
        XCTAssertEqual(viewModel.title, "Complete your profile")
        XCTAssertEqual(viewModel.message, "Take a few steps to show the kommunity who you really are")
        XCTAssertEqual(viewModel.buttonText, "Let's get it done")
    }

    func testNoModel() async {
        // given
        model.emptyModel = true

        // when
        await viewModel.completeProfle()

        // then
        XCTAssertEqual(viewModel.profilePicBorderColor, Color.red)
        XCTAssertEqual(viewModel.doItButtonGradientColors, [Color("DarkRed"), Color("LightRed")])
        XCTAssertEqual(viewModel.title, "Error completing profile")
        XCTAssertEqual(viewModel.message, "We were unable to complete your profile")
        XCTAssertEqual(viewModel.buttonText, "Try again?")
    }

    func testNoData() async {
        // given
        model.emptyData = true

        // when
        await viewModel.completeProfle()

        // then
        XCTAssertEqual(viewModel.profilePicBorderColor, Color("DarkGreen"))
        XCTAssertEqual(viewModel.doItButtonGradientColors, [Color("DarkGreen"), Color("LightGreen")])
        XCTAssertEqual(viewModel.title, "No title returned")
        XCTAssertEqual(viewModel.message, "No message returned")
        XCTAssertEqual(viewModel.buttonText, "Success!")
    }

    func testCompletionFailed() async {
        // given
        model.success = false

        // when
        await viewModel.completeProfle()

        // then
        XCTAssertEqual(viewModel.profilePicBorderColor, Color.red)
        XCTAssertEqual(viewModel.doItButtonGradientColors, [Color("DarkRed"), Color("LightRed")])
        XCTAssertEqual(viewModel.title, "Error completing profile")
        XCTAssertEqual(viewModel.message, "We were unable to complete your profile")
        XCTAssertEqual(viewModel.buttonText, "Try again?")
    }

    func testCompletionSuccessAndDataValues() async {
        // given
        model.testTitle = "New Title"
        model.testMessage = "New message"

        // when
        await viewModel.completeProfle()

        // then
        XCTAssertEqual(viewModel.profilePicBorderColor, Color("DarkGreen"))
        XCTAssertEqual(viewModel.doItButtonGradientColors, [Color("DarkGreen"), Color("LightGreen")])
        XCTAssertEqual(viewModel.title, "New Title")
        XCTAssertEqual(viewModel.message, "New message")
        XCTAssertEqual(viewModel.buttonText, "Success!")
    }
}
