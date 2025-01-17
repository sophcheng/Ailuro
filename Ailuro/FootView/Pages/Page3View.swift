//
//  Page3View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/7/25.
//

import SwiftUI

struct Page3View: View {
    
    //Store circular text's angle
    @State var rotationA = 0.0
    
    var body: some View {
        
            ZStack{
                Rectangle()
                    .fill(RadialGradient(gradient: Gradient(colors: [.pink, Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1))]), center: .center, startRadius: 1, endRadius: 300))
                    .frame(height: 650)
                    .cornerRadius(30)
                
                VStack{
                    Text("On AI and Awareness")
                        .foregroundStyle(.yellow)
                    Spacer()
                    
                    Text("For AI, we need:")
                        .italic()
                    Image("offCatK")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)
                    Text("\nSTANDARDIZATION:")
                        .fontWeight(.heavy)
                        .shadow(color: Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)), radius: 6)
                    Text("Since AI models are broad & obscure, we lack a scale to measure & compare its environmental impact.")
                    Text("\nTRANSPARENCY:")
                        .fontWeight(.heavy)
                        .shadow(color: Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)), radius: 6)
                    Text("Most (big) companies won't disclose how they train models, nor distinguish AI from general energy use.")
                    
                    ZStack{
                    CircularTextView(title: "Raising awareness is Step 1! :3", radius: 70, degrees: -150, kerning: 2)
                        .font(.system(size: 16, weight: .bold, design: .monospaced))
                        .shadow(color: .black, radius: 6)
                        .foregroundColor(.yellow)
                        .frame(width: 170, height: 170)
                        .rotationEffect(.degrees(rotationA))
                        .onAppear{
                            withAnimation(.linear(duration: 60).repeatForever(autoreverses: false)){
                                rotationA = 360
                            }
                        }
                    Image("offCatO.click")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120)
                    }
                    Spacer()
                    
                    NavigationLink(destination: WorldView()){
                    Text("AI for a Better Earth")
                            .foregroundStyle(.blue)
                        .italic()
                    }
                }
                .foregroundStyle(.white)
                .frame(width: 300, height: 750)
            }
        }
    }

#Preview {
    Page3View()
}
