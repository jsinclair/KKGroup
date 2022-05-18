//
//  EventsButton.swift
//  KKGroupDemo
//
//  Created by James Sinclair on 2022/05/17.
//

import SwiftUI

struct EventsButton: View {
    var body: some View {
        Button(action: {

        }, label: {
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text("EVENTS & E-TICKETS")
                        .multilineTextAlignment(.leading)
                        .font(Font.custom("BebasNeue", size: 39))
                    Spacer()
                    Text("Buy and access your party and workshop tickets")
                        .multilineTextAlignment(.leading)
                        .font(Font.custom("Lato", size: 13))
                    Spacer()
                }
                .padding()

                Spacer()

                VStack {
                    Image("Events")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 200)
                        .offset(x: -66)
                }
                .zIndex(-1)
            }
            .foregroundColor(.white)
            .background(RoundedRectangle(cornerRadius: 25)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color("EventsDark"),
                            Color("EventsLight")
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing))
                    .shadow(color: Color("AlmostWhite"), radius: 1))
        })
    }
}

struct EventsButton_Previews: PreviewProvider {
    static var previews: some View {
        EventsButton()
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/200.0/*@END_MENU_TOKEN@*/))
    }
}
