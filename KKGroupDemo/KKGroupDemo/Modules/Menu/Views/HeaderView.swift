//
//  HeaderView.swift
//  KKGroupDemo
//
//  Created by James Sinclair on 2022/05/18.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            Image("ProfilePic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding(.leading)

            VStack(alignment: .leading) {
                Text("ESSEXLAD").font(Font.custom("BebasNeue", size: 31))
                Text("View and edit profile").font(Font.custom("Lato", size: 13))
            }

            Spacer()

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.6))
                    .frame(width: 40, height: 40)
            })
        }
        .padding()
        .background(Color.white)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(
                .fixed(
                    width: /*@START_MENU_TOKEN@*/300.0/*@END_MENU_TOKEN@*/,
                    height: /*@START_MENU_TOKEN@*/80.0/*@END_MENU_TOKEN@*/
                )
            )
    }
}
