//
//  WorldView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 12/28/24.
//

import SwiftUI
import SwiftData

struct WorldView: View {
    
    //Update data operations
    @Environment(\.modelContext) private var context
    
    var body: some View {
        //TODO: ScrollView -> WATER, TabView -> WIND, single page -> FOSSIL FUELS...? SOLAR?
        ScrollView{
            VStack{
                Image(systemName: "cat")
                    .foregroundStyle(.green)
                Text("Like my last marriage, AI and Earth have a complicated relationship. Let's take a look at the indirect impact.")
                    .lineLimit(5)
                Image("envDraft")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("Meow, let's take care of our little green ball...not yarn ball!")

                Image("ailuroDraft")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("(I hope you're not ailurophobic...)")
                Image("officeDraft")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .frame(maxWidth: .infinity)
            .lineLimit(15)
            .padding()
        }
    }
}

#Preview {
    WorldView().modelContainer(for: CatData.self, inMemory: false)
}
