//
//  ContentView.swift
//  KKGroupDemo
//
//  Created by James Sinclair on 2022/05/13.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented = false

    var body: some View {
        VStack(spacing: 0) {
            Color("BackgroundColor")
                .ignoresSafeArea()

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
                .shadow(color: .gray,
                        radius: 5))
        }.ignoresSafeArea(.all, edges: .bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().previewDevice("iPhone SE (1st generation)")
            ContentView().previewDevice("iPhone 8")
            ContentView().previewDevice("iPhone 13 Pro Max")
        }
    }
}
