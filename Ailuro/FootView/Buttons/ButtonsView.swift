//
//  Page1View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/4/25.
//

import SwiftUI
import SwiftData

struct ButtonsView: View {
    
    //View model
    @StateObject var vm = KitKotViewModel()
    
    //Identify which page
    @Binding var foot: FootData
    
    //Manage pop-ups
    @State var isCommentPopped = false
    @State var isSharePopped = false
    @State var shareImage = "ailuroDraft"
    
    //Update whether heart was pressed
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack{
            HStack{
                Spacer()
                VStack{
                    Button(
                        action:{
                            heartPressed()
                        },
                        label: {
                            Image(systemName: foot.isHearted ? "pawprint.fill" : "pawprint")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 40)
                                .foregroundStyle(.pink)
                        }) // Heart Button
                    .padding()
                    Button(
                        action: {
                            isCommentPopped = true
                        },
                        label: {
                            Image(systemName: "ellipsis.message.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 38)
                                .foregroundStyle(.green)
                        }) // "Comment" Button
                    .sheet(isPresented: $isCommentPopped) {
                        ZStack{

                            LinearGradient(gradient: Gradient(colors: [ Color(#colorLiteral(red: 0.1951702535, green: 0.2001738846, blue: 0.4879345298, alpha: 1)), Color(#colorLiteral(red: 0.4549577832, green: 0.8366284966, blue: 0.7456832528, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                                .ignoresSafeArea()
                                VStack{
                                    Text("Com-meow-nts")
                                        .fontWeight(.heavy)
                                        .foregroundStyle(.white)
                                        .font(.system(size: 18))
                                        .padding()
                                    Spacer()
                                    Group{
                                        switch foot.index {
                                        case 1:
                                            Comments1View()
                                            
                                        case 2:
                                            Comments2View()
                                            
                                        default:
                                            Comments3View()
                                        }
                                    }
                                    .frame(width: 300)
                                    .lineLimit(10)
                                    Spacer()
                                }
                            }
                    }

                    .padding()

                    NavigationLink(destination: ContentView()){
                        Image(systemName: "house.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.blue)

                    }
                    .padding()
                    // Home
                }
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
                .opacity(0.8)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func heartPressed() {
        self.foot.isHearted.toggle()
        vm.updateData(foot: foot, context: context)
    }
}

#Preview {
    ButtonsView(foot: .constant(FootData(index: 1)))
}
