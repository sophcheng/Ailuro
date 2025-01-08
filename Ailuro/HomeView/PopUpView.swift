//
//  PopUpView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/5/25.
//

import SwiftUI

struct PopUpView: View {
    var body: some View {

        TabView{
            ZStack{
                Color.yellow
                    .ignoresSafeArea()
                    .cornerRadius(20)
                Rectangle()
                    .foregroundStyle(.white)
                    .frame(width: 320, height: 600)
                    .cornerRadius(20)
                    Image("ailuroDraft")
                        .frame(width: 320, height: 600)
                        .opacity(0.5)
                        .cornerRadius(20)
                        .padding()
                VStack{
                    HStack{
                        Text("A B O U T : ")
                        Image(systemName: "pawprint.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                        Text(" A I L U R O")
                    }
                        .padding(.top, 30)
                        .fontWeight(.heavy)
                    Spacer()
//                    Image(systemName: "pawprint.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 40)
//                        .padding(.bottom, 15)
                }
                VStack{
//                    ZStack{
//                        Rectangle()
//                            .cornerRadius(20)
//                            .foregroundStyle(.white)
//                        VStack{
//                            Image(systemName:"cat.fill")
//                            Text("What's 'AILURO' mean?")
//                                .fontWeight(.heavy)
//                            Text("'Ailuro' is Greek for 'cat', which you might recognize from 'ailurophobia' - a fear of cats.")
//                                .padding()
//                        }
//                    }
//                    .frame(width: 300, height: 200)
                    Image(systemName:"cat.fill")
                    Text("What's 'AILURO' mean?")
                        .fontWeight(.heavy)
                    Text("'Ailuro' is ")
                    + Text("Greek for 'cat'")
                        .fontWeight(.heavy)
                    + Text(", which you might recognize from ")
                    + Text("'ailurophobia'")
                        .fontWeight(.heavy)
                    + Text(" - a fear of cats.")

                    
                    Image(systemName: "person.fill.questionmark")
                        .padding(.top, 10)
                    Text("When we talk about ")
                    + Text("AI")
                        .fontWeight(.heavy)
                    + Text(", a good mix of feelings fester:")
                    Text("Unclarity, Confusion, Fear, Curiosity...")
                        .fontWeight(.heavy)
                    
                    Image(systemName: "brain.head.profile.fill")
                        .padding(.top, 10)
                    Text("Truth be told, this is the same mix I felt when I first learned about cats!")
                        .fontWeight(.semibold)
                }
                .fontWeight(.medium)
                .frame(width: 300)
            } // AILURO Definition
            ZStack{
                Color.black
                    .ignoresSafeArea()
                    .cornerRadius(20)
                Image("ailuroDraft")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.3)
                VStack{
                    Image(systemName:"person.fill.questionmark")
                    Text("Okay, cat is 'ailuro', and 'ailuro' starts with 'AI'...but where's the further connection?")
                        .fontWeight(.heavy)
                    Group{
                        Image(systemName:"questionmark")
                            .padding(.top, 10)
                        Text("Well, that confusion you feel is the disconnect many feel between AI and the environment.")
                            .fontWeight(.medium)
                        
                        Image(systemName:"globe.americas.fill")
                            .padding(.top, 10)
                        Text("It's easy to fur-get that, behind the words and letters that magically appear on our screen, there are rows on rows of supercomputers that chow down energy like catnip.")
                    }
                    .foregroundStyle(.white)
                        Image(systemName:"pawprint.fill")
                            .foregroundStyle(Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)))
                            .padding(.top, 10)
                        Text("AILURO")
                            .foregroundStyle(Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)))
                            .fontWeight(.heavy)
                        Text("seeks to demystify the AI field, presenting the paw-sitive, ne-gat(o)-ive, & nuanced impact of AI!")
                            .foregroundStyle(Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)))
                            .fontWeight(.semibold)
                    
                }
                .foregroundStyle(.yellow)
                .shadow(radius:10)
                .frame(width: 300)
                } // Deeper concept explanation
            //TODO: Works cited?
        }
        .font(.system(size: 17, weight: .light, design: .monospaced))
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .imageScale(.large)
        .padding()
        .multilineTextAlignment(.center)
        .shadow(radius:10)
        }
        
    }


#Preview {
    PopUpView()
}
