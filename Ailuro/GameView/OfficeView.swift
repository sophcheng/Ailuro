//
//  OfficeView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/5/25.
//

import SwiftUI

struct OfficeView: View {
    var body: some View {
        VStack{
            Image("officeDraft")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("COR-PURR-ATE REVIEW:")
        }
        .padding()
    }
        
}

#Preview {
    OfficeView()
}
