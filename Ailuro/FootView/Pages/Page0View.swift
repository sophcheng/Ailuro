//
//  Page0View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/7/25.
//

import SwiftUI

struct Page0View: View {
    var body: some View {
        ZStack{
            Image("envDraft") //TODO: NIX
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.3)
            VStack{
                Text("For you . . . or is it?")
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                Spacer()
                //ChatGPT, Google Search, or apps like TikTok! (Recommendations are AI-enhanced!)
                // (On AILURO, we have KitKot.)
                //TODO: the cats you raise on AI-LURO, based on the work they do, affects the app's look?
                Text("Artificial intelligence: where computers have human-like behavior. \n\nThis includes decision-making, pattern recognition, and translation (of languages, of senses (vision), etc.).")
                Text("\nIt's in games, search engines, social media (on Planet AI-LURO, we use KitKot!) & more!")
                Text("\nHow an AI thinks is obscure - we often let AI models find their own patterns/methods (unsupervised learning), so it's hard to know exactly what goes on behind thes scenes.")
                Text("\nAI is like a cat: constantly observing its surroundings, ever evolving & with a touch of mysteriousness. (And some people are really afraid of them.)")
                Spacer()
            }
            .frame(width: 300, height: 750)
        }
    }
}

#Preview {
    Page0View()
}
