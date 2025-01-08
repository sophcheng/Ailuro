//
//  OutsideView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/5/25.
//

import SwiftUI

struct OutView: View {
    var body: some View {
        Image("envBack1")
            .resizable()
            .aspectRatio(contentMode: .fit)
        Text("ENVIRONMENT STATUS:")
    }
}

#Preview {
    OutView()
}
