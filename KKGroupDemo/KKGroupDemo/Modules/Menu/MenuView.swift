//
//  MenuView.swift
//  KKGroupDemo
//
//  Created by James Sinclair on 2022/05/16.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(spacing: 0) {

            // Header
            HeaderView()

            // Content
            ScrollView(.vertical) {
                VStack {
                    // Get verified
                    GetVerifiedView()

                    // Complete profile
                    CompleteProfileView()

                    // Events
                    EventsButton()
                }
                .padding()
            }

            // Options
            VStack(spacing: 8) {
                OptionsItem(systemImage: "gearshape.fill", title: "ACCOUNT SETTINGS")

                Divider()

                OptionsItem(systemImage: "rectangle.portrait.and.arrow.right", title: "LOGOUT")

                Divider()
                    .padding(.bottom)
            }
            .padding(.top, 8)
            .background(Rectangle()
                .fill(Color.white)
                .shadow(color: Color("AlmostWhite"),
                        radius: 4))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MenuView().previewDevice("iPhone SE (1st generation)")
            MenuView().previewDevice("iPhone 8")
            MenuView().previewDevice("iPhone 13 Pro Max")
        }
    }
}
