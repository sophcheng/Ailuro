//
//  Page3View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/7/25.
//

import SwiftUI

struct Page3View: View {
    var body: some View {
        ZStack{
            Image("ailuroDraft")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.6)
            VStack{
                Text("Global Energy Consumption & AI")
                Spacer()
                Text("Data centers = ~2% of overall electricty consumed worldwide - this % projected to grow exponentially, as AI also rockets to higher and higher usage rates & complexities")
                Text("\nLack of standardization: Given how broad & obscure AI models work, we still haven't agreed on a scale to measure & compare its environemntal impact.")
                Text("\nLack of transparency: Many companies (Google, Amazon, etc.) unwilling to separate what part of energy consumption is AI & just general use; also unwilling to disclose much on model's training/creation process")
                Spacer()
                Text("Swipe left to continue")
                    .italic()
            }
            .frame(width: 300, height: 750)
        }
    }
}

#Preview {
    Page3View()
}
