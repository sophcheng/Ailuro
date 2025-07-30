//
//  Page3View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/4/25.
//

import SwiftUI

struct Page2View: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            ZStack{
                Rectangle()
                    .fill(Color(.white))
                    .frame(height: 650)
                    .cornerRadius(30)
                
                Image("envBack1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.3)
                    .cornerRadius(30)
                
                VStack{
                    Text("Data Centers")
                        .foregroundStyle(.yellow)
                    Spacer()
                    
                    VStack{
                        Text("DATA CENTER:")
                            .fontWeight(.heavy)
                        Group{
                            Text("A ")
                            + Text("warehouse full of servers ")
                                .fontWeight(.heavy)
                            + Text("working")
                            + Text(" 24/7;")
                                .fontWeight(.heavy)
                            + Text (" used for crypto, cloud data, & AI compute.")
                        }
                        .padding()
                        Image("dataCenter")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:300)
                            .cornerRadius(20)
                        Text("REQUIRES LOTS OF:")
                            .fontWeight(.heavy)
                            .padding()
                        
                        Text("Energy,")
                            .fontWeight(.heavy)
                        + Text(" to run all ~100K servers, 24/7.")
                        Text("Water,")
                            .fontWeight(.heavy)
                        + Text(" to cool down computers, 24/7.")
                    }
                    .padding()
                    Group{
                        Text("Data centers = Sweden = ")
                        + Text("~2% of electricity consumed globally!")
                            .fontWeight(.heavy)
                    }
                        .multilineTextAlignment(.center)
                    Spacer()
                        .italic()
                }
                .frame(width: 300, height: 750)
            }
            
            ZStack{
                Rectangle()
                    .fill(Color(.white))
                    .frame(height: 650)
                    .cornerRadius(30)
                Image("officeDraft")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.4)
                    .cornerRadius(30)
                VStack{
                    Text("Visualizing the Impact")
                        .foregroundStyle(.yellow)
                        .italic()
                    Spacer()
                    
                    Text("\n1 ChatGPT prompt = ")
                    + Text ("1 hour of light ")
                        .fontWeight(.heavy)
                    + Text("from low-lumen bulb")
                    Text("\nEnergy used per")
                    + Text(" ChatGPT prompt:")
                        .fontWeight(.heavy)
                    Text("10440 J = 2.9 wH")
                        .fontWeight(.heavy)
                    Text("\nEnergy used per")
                    + Text(" Google Search:")
                        .fontWeight(.heavy)
                    Text("1044 J = 0.3 wH")
                        .fontWeight(.heavy)
                    Text("\nChatGPT uses ten times as much as energy!")
                        .fontWeight(.semibold)
                    Text("Share your thoughts in the comments!")
                        .fontWeight(.heavy)
                    Spacer()
                    
                    Text("Swipe left to continue")
                        .foregroundStyle(Color(#colorLiteral(red: 0.9691733718, green: 0.34777385, blue: 0.5364941955, alpha: 1)))
                        .italic()
                }
                .frame(width: 300, height: 750)
            }
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    Page2View()
}
