//
//  Comments1View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/7/25.
//

import SwiftUI

struct Comments1View: View {
    var body: some View {
            Group{
                ZStack{
                    Rectangle()
                        .fill(Color.yellow)
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("Socks")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                        Image("ailuroCat")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(.leading, 10)
                        }
                    Text("data is used before (training), during (validation/testing), & after the creation process")
                        .padding()
                    }
                    , alignment: .leading)
                        
                }
                .frame(height: 150)
                
                ZStack{
                    Rectangle()
                        .fill(Color.yellow)
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("bob")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                            Image("ailuroCrash")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.leading, 10)
                        }
                        Text("TRAINING NEVER REALLY STOPS! THE AI CONTINUOUSLY LEARNS & IMPROVES!!")
                            .padding()
                        
                    }
                    , alignment: .leading)
                }
                .frame(height: 150)
                ZStack{
                    Rectangle()
                        .fill(Color.yellow)
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("Socks")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                            Image("ailuroCat")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.leading, 10)
                        }
                        Text("unlike u bob...")
                            .padding()
                    }
                    , alignment: .leading)
                }
                .frame(height: 100)
                ZStack{
                    Rectangle()
                        .fill(Color.yellow)
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("Boss")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                            Image("ailuroWorld")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.leading, 10)
                        }
                        Text("Get back to work you two.")
                            .padding()
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
