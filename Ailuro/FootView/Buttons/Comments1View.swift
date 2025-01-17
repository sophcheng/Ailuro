//
//  Comments1View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/7/25.
//

import SwiftUI

struct Comments1View: View {
    
    var body: some View {
        
            ScrollView(showsIndicators: false){
                
                //Socks comments
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("Socks")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                        Image("offCatO.click")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(.leading, 10)
                        }
                        Text("how an AI thinks is obscure! usually, the model finds their own patterns/methods (unsupervised learning), so it's hard to know exactly what happens bts")
                        .padding()
                    }
                    , alignment: .leading)
                        
                }
                .frame(height: 230)
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("Socks")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                        Image("offCatO")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(.leading, 10)
                        }
                    Text("still, data's used b4 (training), during (validation/testing), & after the creation process")
                        .padding()
                    }
                    , alignment: .leading)
                        
                }
                .frame(height: 150)
                
                //Bob comments
                ZStack{
                    Rectangle()
                        .fill(Color.yellow)
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        Text("TRAINING NEVER REALLY STOPS! THE AI CONTINUOUSLY LEARNS & IMPROVES!!")
                            .padding()
                        VStack{
                            Text("bob")
                                .padding(.trailing, 15)
                                .fontWeight(.heavy)
                            Image("offCatP.click")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 10)
                        }
                        
                    }
                    , alignment: .trailing)
                }
                .frame(height: 130)
                
                //Socks retaliates
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        Text("unlike u bob...")
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
                .frame(height: 100)
                
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
                        Text("Get back to work you two.")
                            .padding()
                            .foregroundStyle(.white)
                    }
                    , alignment: .leading)
                }
                .frame(height: 100)
            }
            .frame(width: 280)
            .padding()
            .font(.system(size: 15, weight: .semibold, design: .monospaced))
        }

    }


#Preview {
    Comments1View()
}
