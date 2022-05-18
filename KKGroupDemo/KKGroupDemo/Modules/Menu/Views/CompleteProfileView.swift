//
//  CompleteProfileView.swift
//  KKGroupDemo
//
//  Created by James Sinclair on 2022/05/17.
//

import SwiftUI

struct CompleteProfileView: View {

    @ObservedObject var profileViewModel = ProfileViewModel(model: ConcreteCompleteProfileModel())

    @State private var completing = false

    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                HStack {
                    Image("ProfilePic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .background(Circle().foregroundColor(.white))
                        .overlay(Circle().stroke(profileViewModel.profilePicBorderColor, lineWidth: 5))
                        .frame(minWidth: 50, idealWidth: 50, maxWidth: 80)

                    Spacer()

                    HStack {
                        VStack(alignment: .leading) {
                            Text(profileViewModel.title)
                                .font(Font.custom("BebasNeue", size: 29))
                            Text(profileViewModel.message)
                                .font(Font.custom("Lato", size: 13))
                        }

                        Spacer()
                    }
                }

                Button(action: {
                    completing = true
                    Task {
                        await profileViewModel.completeProfle()
                        completing = false
                    }
                }, label: {
                    Spacer()
                    Text(profileViewModel.buttonText)
                        .font(Font.custom("Lato", size: 16)).bold()
                    Spacer()
                })
                .foregroundColor(.white)
                .padding()
                .background(RoundedRectangle(cornerRadius: 25)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: profileViewModel.doItButtonGradientColors),
                            startPoint: .leading,
                            endPoint: .trailing)))
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                    .shadow(color: Color("AlmostWhite"), radius: 1))

            if completing {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color("AlmostWhite"))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                ProgressView()
                    .tint(Color("DarkBlue"))
            }
        }.animation(.default, value: UUID())
    }
}

struct CompleteProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteProfileView()
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/, height: 250))
    }
}
