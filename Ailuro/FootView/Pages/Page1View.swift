//
//  Page2View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/4/25.
//

import SwiftUI

struct Page1View: View {
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .fill(RadialGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)), .black]), center: .center, startRadius: 1, endRadius: 400))
                .frame(height: 650)
                .cornerRadius(30)
            
            VStack{
                Text("How does AI work?")
                    .foregroundStyle(.yellow)
                    .italic()
                Spacer()
                
                Text("Lots, lots, and lots of data.")
                    .fontWeight(.heavy)
                Text("\nFor example, a chatbot:")
                Text("\n1. You enter in a prompt.")
                Text("\n2. This prompt is broken into ")
                + Text("tokens")
                    .fontWeight(.heavy)
                + Text(": pieces that AI comprehends. ")
                Text("\n3. Based on tokens + training, the result is computed in a ")
                + Text ("data center.")
                    .fontWeight(.heavy)
                Image("offCatG")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:150)
                    .cornerRadius(20)
                    .padding()
                Text("\nAll this data has to go somewhere - not just letters and numbers on your screen!")
                    .multilineTextAlignment(.center)
                    .fontWeight(.heavy)
                Spacer()
                
                Text("Swipe left to continue")
                    .foregroundStyle(Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)))
                    .italic()
            }
            .foregroundStyle(.white)
            .frame(width: 300, height: 750)
        }
    }
}

#Preview {
    Page1View()
}
