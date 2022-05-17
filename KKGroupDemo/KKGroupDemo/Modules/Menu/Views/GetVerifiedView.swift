//
//  GetVerifiedView.swift
//  KKGroupDemo
//
//  Created by James Sinclair on 2022/05/17.
//

import SwiftUI

struct GetVerifiedView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("GET VERIFIED")
                    .font(Font.custom("BebasNeue", size: 40))
                Text("Become a trusted member of the kommunity and start interacting")
                    .font(Font.custom("Lato", size: 14))
                Button(action: {

                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(gradient: Gradient(colors: [
                                Color("DarkRed"),
                                Color("LightRed")
                            ]),
                                                 startPoint: .leading,
                                                 endPoint: .trailing))
                        HStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                            Text("Verify now")
                                .font(Font.custom("Lato", size: 14))
                                .bold()
                        }
                        .foregroundColor(.white)

                    }.frame(width: 150, height: 37)
                })
            }
            .padding()

            Spacer()

            VStack {
                Spacer()
                Image("GetVerified")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 150)
                    .offset(x: -44)
            }
            .zIndex(-1)
        }
        .background(
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
                .shadow(color: Color("AlmostWhite"), radius: 1))
    }
}

struct GetVerifiedView_Previews: PreviewProvider {
    static var previews: some View {
        GetVerifiedView()
            .previewLayout(.fixed(width: 350, height: 200))
    }
}
