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
                    Text("ESSEXLAD").font(.headline).bold()
                    Text("View and edit profile").font(.caption)
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
                                .font(.title)
                            Text("Become a trusted member of the kommunity and start interacting")
                                .font(.caption)
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
                                .offset(x: -40)
                        }
                        .zIndex(-1)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.white)
                    ).clipped()

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
                                    .font(.title)
                                Text("Take a few steps to show the kommunity who you really are")
                                    .font(.caption)
                            }

                            Spacer()
                        }

                        Button(action: {

                        }, label: {
                            Spacer()
                            Text("Let's get it done")
                                .bold()
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
                            .foregroundColor(.white))
                    .clipped()

                    // Events
                    Button(action: {

                    }, label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Spacer()
                                Text("EVENTS & E-TICKETS")
                                    .multilineTextAlignment(.leading)
                                    .font(.title)
                                Spacer()
                                Text("Buy and access your party and workshop tickets")
                                    .multilineTextAlignment(.leading)
                                    .font(.caption)
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
                                        endPoint: .trailing)))
                        .clipped()
                    })
                    .padding(.top, 5)
                }
                .padding()
            }

            // Options
            VStack {
                OptionsItem(systemImage: "gearshape.fill", title: "ACCOUNT SETTINGS")

                Divider()

                OptionsItem(systemImage: "rectangle.portrait.and.arrow.right", title: "LOGOUT")

                Divider()
                    .padding(.bottom)
            }
            .padding(.top)
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
                    .font(.title2)
                    .bold()
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
