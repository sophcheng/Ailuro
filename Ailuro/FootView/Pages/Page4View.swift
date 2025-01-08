//
//  Page4View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/7/25.
//

import SwiftUI

struct Page4View: View {
    var body: some View {
        ZStack{
            Image("envDraft")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.3)
            VStack{
                Text("Paw-ssible Next Steps")
                Spacer()
                Text("CLEAN ENERGY")
                Text("\nData centers need 24/7 energy; clean energy = less consistent (dependent on weather, variables out of our control); cannot be used 24/7 (fossil fuels still needed), but could help")
                Text("\n\nEFFICIENCY IN AI")
                Text("\nChoosing the correct model (i.e. not over-complicating) and efficiently choosing/sourcing data (everything is purposeful; find alternatives to generating fake data in training, too) are better for both the environment & your model's performance!")
                Text("Important to remember that coding is not just text on your screen: still has physical implications~")
                Spacer()
                Text("Swipe left to continue")
                    .italic()
            }
            .frame(width: 300, height: 750)
        }
    }
}

#Preview {
    Page4View()
}
