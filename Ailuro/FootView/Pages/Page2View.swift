//
//  Page3View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/4/25.
//

import SwiftUI

struct Page2View: View {
    var body: some View {
        ScrollView{
            ZStack{
                Image("officeDraft")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.3)
                VStack{
                    Text("What's a Data Center?")
                    Spacer()
                    Text("Data center:")
                        .fontWeight(.heavy)
                    + Text(" a warehouse full of supercomputers working 24/7; used mainly to process crypto, store cloud data, and compute AI tasks.")
                    Text("Data centers require: ")
                    Text("\nLots of energy to run the computers, all of the time.")
                    Text("\nLots of water to cool down the computers, all of the time.")
                    Spacer()
                        .italic()
                }
                .frame(width: 300, height: 750)
            }
            ZStack{
                Image("envBack1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.3)
                VStack{
                    Text("Visualizing the Impact")
                    Spacer()
                    Text("\nLet's put it in purr-spective:")
                    Text("\nEnergy used per ChatGPT prompt: 10440 J = 2.9 wH")
                    Text("\nEnergy used per Google Search: 1044 J = 0.3 wH")
                    Text("\nAI like ChatGPT have really complex lanaguge models. So, AI can produce more helpful results than Google. A trade-off to consider!")
                    Spacer()
                    Text("Swipe left to continue")
                        .italic()
                }
                .frame(width: 300, height: 750)
            }
        }
    }
}

#Preview {
    Page2View()
}
