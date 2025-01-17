//
//  Page0View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/7/25.
//

import SwiftUI

struct Page0View: View {
    
    //Store circular text's angle
    @State var rotationA = 0.0
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .fill(RadialGradient(gradient: Gradient(colors: [.black, Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)), Color(#colorLiteral(red: 0.9606881738, green: 0.4666238427, blue: 0.5169212222, alpha: 1))]), center: .center, startRadius: 1, endRadius: 400))
                .frame(height: 650)
                .cornerRadius(30)
            
            VStack{
                Text("Welcome to KitKot!")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.yellow)
                Spacer()

                Text("Artificial intelligence: where computers have human-like behavior...")

                ZStack{
                CircularTextView(title: "AI is Decision-Making, Pattern Recognition, Translation, etc..", radius: 120, degrees: -35, kerning: 2)
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                    .shadow(color: .black, radius: 6)
                    .foregroundColor(Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1)))
                    .frame(width: 295, height: 295)
                    .rotationEffect(.degrees(rotationA))
                    .onAppear{
                        withAnimation(.linear(duration: 100).repeatForever(autoreverses: false)){
                            rotationA = 360
                        }
                    }
                    
                Image("offCatP.click")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:200)
                    .cornerRadius(20)
                }
                .padding()
                
                Text("AI = a cat: observant, ever-evolving & kinda mysterious @_@ \n\n(And some people are really scared of them...)")
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
            .frame(width: 300, height: 750)
            .foregroundStyle(.white)
        }

    }
}

#Preview {
    Page0View()
}
