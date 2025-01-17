//
//  Comments2View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/9/25.
//

import SwiftUI

struct Comments2View: View {
    
    var body: some View {
        
            ScrollView(showsIndicators: false){
                
                //Boss comments
                ZStack{
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)))
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("Boss")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                        Image("offCatB")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(.leading, 10)
                        }
                        Text("AI like ChatGPT use lots of energy bc they hv rly complex language models.")
                            .foregroundStyle(.white)
                        .padding()
                    }
                    , alignment: .leading)
                        
                }
                .frame(height: 130)
                ZStack{
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)))
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("Boss")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                        Image("offCatB.click")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(.leading, 10)
                        }
                    Text("So, AI can yield more helpful results than Google. A trade-off to consider.")
                            .foregroundStyle(.white)
                        .padding()
                        
                    }
                    , alignment: .leading)
                        
                }
                .frame(height: 150)
                
                //CatGPT comments
                ZStack{
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)))
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("CatGPT")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                            Image("offCatG.click")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.leading, 10)
                        }
                        Text("&& 1 ChatGPT query ≠ 1 Google search. 1 ChatGPT query can save time && energy from >1 Google searches.")
                            .padding()
                        
                    }
                    , alignment: .leading)
                }
                .frame(height: 160)
                
                //Socks comments
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        Text("i mean i still hv to fact check chatgpt w/ google. cuz yall like to make up info sometimes #gaslight")
                            .padding()
                        VStack{
                            Text("Socks")
                                .padding(.trailing, 15)
                                .fontWeight(.heavy)
                            Image("offCatO.emo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 10)
                        }
                    }
                    , alignment: .trailing)
                }
                .frame(height: 160)
                
                //Boss comments
                ZStack{
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)))
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("Boss")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                            Image("offCatB")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.leading, 10)
                        }
                        Text("Yes, it's a really tricky comparison.")
                            .foregroundStyle(.white)
                            .padding()
                    }
                    , alignment: .leading)
                }
                .frame(height: 100)
                ZStack{
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)))
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("Boss")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                            Image("offCatB")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.leading, 10)
                        }
                        Text("We estimate the best we can w/ these stats, though.")
                            .foregroundStyle(.white)
                            .padding()
                    }
                    , alignment: .leading)
                }
                .frame(height: 120)
            }
            .frame(width: 280)
            .padding()
            .font(.system(size: 15, weight: .semibold, design: .monospaced))
        }

    }


#Preview {
    Comments2View()
}
