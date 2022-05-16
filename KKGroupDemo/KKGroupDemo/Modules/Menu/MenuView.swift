//
//  MenuView.swift
//  KKGroupDemo
//
//  Created by James Sinclair on 2022/05/16.
//

import SwiftUI

struct MenuView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 0) {

            // Header
            HStack {
                Image("ProfilePic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .padding(.leading)

                VStack(alignment: .leading) {
                    Text("ESSEXLAD").font(Font.custom("BebasNeue", size: 31))
                    Text("View and edit profile").font(Font.custom("Lato", size: 14))
                }

                Spacer()

                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 40, height: 40)
                })
            }
            .padding()
            .background(Color.white)

            // Content
            ScrollView(.vertical) {
                VStack {
                    // Get verified
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

                    // Complete profile
                    VStack {
                        HStack {
                            Image("ProfilePic")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .background(Circle().foregroundColor(.white))
                                .overlay(Circle().stroke(.red, lineWidth: 5))
                                .frame(minWidth: 50, idealWidth: 50, maxWidth: 80)

                            Spacer()

                            VStack(alignment: .leading) {
                                Text("COMPLETE YOUR PROFILE")
                                    .font(Font.custom("BebasNeue", size: 36))
                                Text("Take a few steps to show the kommunity who you really are")
                                    .font(Font.custom("Lato", size: 14))
                            }

                            Spacer()
                        }

                        Button(action: {

                        }, label: {
                            Spacer()
                            Text("Let's get it done")
                                .font(Font.custom("Lato", size: 14)).bold()
                            Spacer()
                        })
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color("DarkBlue"),
                                        Color("LightBlue")
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing)))
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.white)
                            .shadow(color: Color("AlmostWhite"), radius: 1))

                    // Events
                    Button(action: {

                    }, label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Spacer()
                                Text("EVENTS & E-TICKETS")
                                    .multilineTextAlignment(.leading)
                                    .font(Font.custom("BebasNeue", size: 40))
                                Spacer()
                                Text("Buy and access your party and workshop tickets")
                                    .multilineTextAlignment(.leading)
                                    .font(Font.custom("Lato", size: 14))
                                Spacer()
                            }
                            .padding()

                            Spacer()

                            VStack {
                                Image("Events")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 90, height: 190)
                                    .offset(x: -60)
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
                    .padding(.top, 5)
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
                .shadow(color: .gray,
                        radius: 5))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MenuView().previewDevice("iPhone SE (1st generation)")
            MenuView().previewDevice("iPhone 8")
            MenuView().previewDevice("iPhone 13 Pro Max")
        }
    }
}