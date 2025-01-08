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
            Image("envDraft") //TODO: NIX
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.3)
            VStack{
                Text("How does AI work?")
                    .italic()
                Spacer()
                Text("Lots, lots, and lots of data.")
                Text("\nGenerative AI is the most costly!")
                Text("\nFor example, a chatbot:")
                Text("\n1. You enter in a prompt.")
                Text("\n2. Prompt is broken into ")
                + Text(" tokens")
                    .fontWeight(.heavy)
                + Text("; each token = ingredient for AI model to cook response with (based on training with data it already ate")
                Text("\n3. Data is computed in a ")
                + Text ("data center")
                    .fontWeight(.heavy)
                + Text(" - meow-re on this later! - and the result is sent back to you.")
                Text("All this data has to go somewhere - it's more than just letters and numbers on your screen!")
                Spacer()
                Text("Swipe left to continue")
                    .italic()
            }
        }
        .frame(width: 300, height: 750)
    }
}

#Preview {
    Page1View()
}
