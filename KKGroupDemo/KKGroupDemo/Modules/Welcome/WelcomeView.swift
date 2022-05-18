//
//  WelcomeView.swift
//  KKGroupDemo
//
//  Created by James Sinclair on 2022/05/13.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isPresented = false

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .bottom) {
                Color("BackgroundColor")
                    .ignoresSafeArea()

                VStack {
                    LottieView(lottieFile: "39755-handwritten-welcome")
                        .frame(width: 300, height: 100)

                    LottieView(lottieFile: "4746-welcome-screen")
                        .frame(width: 300, height: 300)
                }
            }

            HStack {
                Spacer()
                Button(action: {
                    self.isPresented.toggle()
                }, label: {
                    Image("MenuIcon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding()
                })
                .fullScreenCover(isPresented: $isPresented, content: MenuView.init)
            }
            .padding(.bottom)
            .background(Rectangle()
                .fill(Color.white)
                .shadow(color: Color("AlmostWhite"),
                        radius: 4))
        }.ignoresSafeArea(.all, edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WelcomeView().previewDevice("iPhone SE (1st generation)")
            WelcomeView().previewDevice("iPhone 8")
            WelcomeView().previewDevice("iPhone 13 Pro Max")
        }
    }
}
