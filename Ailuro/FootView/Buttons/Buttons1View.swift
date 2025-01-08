//
//  Page1View.swift
//  Ailuro
//
//  Created by Sophie Cheng on 1/4/25.
//

import SwiftUI
import SwiftData

struct Buttons1View: View {
    
    //Identify which page
    @State var pageIndex: Int
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
                    .popover(isPresented: $isCommentPopped, arrowEdge: .top) {
                                VStack{
                                    Text("Com-meow-nts")
                                        .fontWeight(.heavy)
                                        .padding()
                                    Spacer()
                                    Group{
                                        switch pageIndex {
                                        case 1:
                                            Comments1View()
                                        case 2:
                                            Text("Page 2 Comments")
                                            
                                        case 3:
                                            Text("Page 3 Comments")
                                            
                                        case 4:
                                            Text("Page 4 Comments")
                                            
                                        default:
                                            Text("Page 0 Comments")
                                        }
                                    }
                                    .frame(width: 300)
                                    .lineLimit(10)
                                    Spacer()
                                }
                            }

                    .padding()
                    Button(
                        action: {
//                            decideImage()
                            isSharePopped = true
                        },
                        label: {
                            Image(systemName: "square.and.arrow.up.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 45)
                                .foregroundStyle(.blue)
                        }) // Share Button
                    .popover(isPresented: $isSharePopped, arrowEdge: .bottom){
                        Text("TODO")
                    }
                    .padding()
                    NavigationLink(destination: ContentView()){
                        Image(systemName: "house.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.yellow)

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
        .onTapGesture(count: 2,
                      perform: {
            heartPressed()
        })
    }
    
    func heartPressed() {
        self.foot.isHearted.toggle()
    }
//    func decideImage(){
//        switch pageIndex {
//        case 1:
//            shareImage = "ailuroCat"
//        case 2:
//            shareImage = "ailuroCrash"
//        case 3:
//            shareImage = "ailuroWorld"
//        case 4:
//            shareImage = "officeDraft"
//        default:
//            shareImage = "ailuroDraft"
//        }
//    }
//    func sharePopover() -> some View{
//        VStack{
//            Text(shareImage)
//            Image(shareImage)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//        }
//    }
}

#Preview {
    Buttons1View(pageIndex: 1, foot: .constant(FootData()))
}
