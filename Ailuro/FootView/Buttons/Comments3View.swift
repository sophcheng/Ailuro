//
//  Comments3View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/9/25.
//

import SwiftUI

struct Comments3View: View {
    var body: some View {
            ScrollView(showsIndicators: false){
                
                //Bob inquires
                ZStack{
                    Rectangle()
                        .fill(.yellow)
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("bob")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                        Image("offCatP")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(.leading, 10)
                        }
                        Text("YO...HOW CAN WE PUT A NUMBER ON AI FOOTPRINT THO? ? ITS SO VAGUE???")
                            .foregroundStyle(.black)
                        .padding()
                    }
                    , alignment: .leading)
                        
                }
                .frame(height: 140)
                ZStack{
                    Rectangle()
                        .fill(.yellow)
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("bob")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                        Image("offCatP.emo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(.leading, 10)
                        }
                        Group{
                    Text("VAGUE LIKE MY LATEST ASSIGNMENT...")
                        + Text("@Boss ")
                                .fontWeight(.heavy)
                        + Text("PLZ...WDYM BY 'Work like an AI, but not literally.' ? ? ?")
                        }
                            .foregroundStyle(.black)
                            .padding()
                        
                        
                    }
                    , alignment: .leading)
                        
                }
                .frame(height: 150)
                
                //Socks dunks on Bob
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        Text("i think boss means u gotta continuously learn & improve, bob.")
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
                .frame(height: 130)
                
                //Generational ratio train:
                ZStack{
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)))
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        Text("I agree with Socks")
                        VStack{
                            Text("MIT-10s")
                                .padding(.trailing, 15)
                                .fontWeight(.heavy)
                            Image("offCatM")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 10)
                        }
                    }
                    , alignment: .trailing)
                }
                .frame(height: 100)
                
                ZStack{
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)))
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        Text("I agree with Socks.")
                        VStack{
                            Text("CatGPT")
                                .padding(.trailing, 15)
                                .fontWeight(.heavy)
                            Image("offCatG")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 10)
                        }
                    }
                    , alignment: .trailing)
                }
                .frame(height: 100)
                
                ZStack{
                    Rectangle()
                        .fill(Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)))
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        Text("w agere Wiht sook s")
                        VStack{
                            Text("Kitt-E")
                                .padding(.trailing, 15)
                                .fontWeight(.heavy)
                            Image("offCatK")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.trailing, 10)
                        }
                    }
                    , alignment: .trailing)
                }
                .frame(height: 100)
                
                //Bob fights back
                ZStack{
                    Rectangle()
                        .fill(.yellow)
                        .cornerRadius(10)
                        .overlay(
                    HStack{
                        VStack{
                            Text("bob")
                                .padding(.leading, 15)
                                .fontWeight(.heavy)
                        Image("offCatP.click")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .padding(.leading, 10)
                        }
                        Group{
                        Text("BACK ME UP RQ ")
                        + Text("@Boss")
                            .fontWeight(.heavy)
                        }
                        .padding()
                        .foregroundStyle(.black)
                    }
                    , alignment: .leading)
                        
                }
                .frame(height: 100)
                
                //Boss's comments
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
                        Text("Buildings have electricity ratings (A-F) that give an idea of eco-friendliness.")
                            .foregroundStyle(.white)
                            .padding()
                    }
                    , alignment: .leading)
                }
                .frame(height: 140)
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
                            Image("offCatB.emo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.leading, 10)
                        }
                        Text("AI models could have smth similar, based on training costs + model structure. Again, we estimate the best we can.")
                            .foregroundStyle(.white)
                            .padding()
                    }
                    , alignment: .leading)
                }
                .frame(height: 160)
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
                        Text("Also, I have no comment on what the others commented above.")
                            .foregroundStyle(.white)
                            .padding()
                    }
                    , alignment: .leading)
                }
                .frame(height: 130)
                
            }
            .frame(width: 280)
            .padding()
            .font(.system(size: 15, weight: .semibold, design: .monospaced))
        }

    }


#Preview {
    Comments3View()
}
