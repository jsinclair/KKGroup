//
//  OptionsItem.swift
//  KKGroupDemo
//
//  Created by James Sinclair on 2022/05/16.
//

import SwiftUI

struct OptionsItem: View {
    let systemImage: String
    let title: String

    var body: some View {
        Button(action: {

        }, label: {
            HStack {
                ZStack {
                    Circle()
                        .foregroundColor(Color("BackgroundColor"))
                        .overlay(Circle().stroke(Color("LightGray"), lineWidth: 1))
                        .frame(width: 40, height: 40)
                    LinearGradient(gradient: Gradient(colors: [Color("LightGray"), Color("DarkGray")]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                    .mask(Image(systemName: systemImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    ).frame(width: 20, height: 20, alignment: .center)

                }
                .padding(.leading)
                Text(title)
                    .font(Font.custom("BebasNeue", size: 32))
                    .foregroundColor(.black)
                Spacer()
            }
        })
    }
}

struct OptionsItem_Previews: PreviewProvider {
    static var previews: some View {
        OptionsItem(systemImage: "gearshape.fill",
                    title: "ACCOUNT SETTINGS")
        .previewLayout(
            .fixed(
                width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/,
                height: /*@START_MENU_TOKEN@*/80.0/*@END_MENU_TOKEN@*/
            )
        )
    }
}
