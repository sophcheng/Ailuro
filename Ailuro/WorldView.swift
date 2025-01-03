//
//  WorldView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 12/28/24.
//

import SwiftUI

struct WorldView: View {
    var body: some View {
        Image(systemName: "cat")
            .foregroundStyle(.green)
        Text("Meow, let's take care of our little green ball...not yarn ball!")
            .frame(width: 200)
            .lineLimit(5)
    }
}

#Preview {
    WorldView()
}
