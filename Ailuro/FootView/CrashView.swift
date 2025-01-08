//
//  CrashView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 12/28/24.
//

import SwiftUI
import SwiftData

struct CrashView: View {
    
    @State private var isTextSwitched = false

    //Store whether heart was pressed
    @State var foot1 = FootData()
    @State var foot2 = FootData()
    @State var foot3 = FootData()
    @State var foot4 = FootData()
    
    //Update data operations
    @Environment(\.modelContext) private var context
    
    var body: some View {

        NavigationStack{
            TabView{
                        ZStack{
                            ScrollView{
                                VStack{
                                    Page0View()
                                    Page1View()
                                }
                            }
                                Buttons1View(pageIndex: 1, foot: $foot1)
                    }
                        .onTapGesture(
                            count: 2,
                            perform:{
                                self.foot1.isHearted.toggle()
//                                    updateData(foot: foot1)
                            })
                
                ZStack{
                    Page2View()
                    Buttons1View(pageIndex: 2, foot: $foot2)
                }
                .onTapGesture(
                    count: 2,
                    perform:{
                        self.foot2.isHearted.toggle()
//                        updateData(foot: foot2)
                    })
                ZStack{
                    Page3View()
                    Buttons1View(pageIndex: 3, foot: $foot3)
                }
                .onTapGesture(
                    count: 2,
                    perform:{
                        self.foot3.isHearted.toggle()
//                        updateData(foot: foot3)
                    })
                ZStack{
                    Page4View()
                    Buttons1View(pageIndex: 4, foot: $foot4)
                }
                .onTapGesture(
                    count: 2,
                    perform:{ self.foot4.isHearted.toggle()
//                        updateData(foot: foot4)
                    })
            }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .font(.system(size: 18, weight: .semibold, design: .monospaced))
            .navigationBarBackButtonHidden(true)

//            .rotationEffect(.degrees(90))
        }
        
    }
//    func updateData(foot: FootData){
//
//            context.insert(foot)
//
//        do{
//            try context.save()
//            if context.hasChanges {
//                print("There are changes")
//            }
//        }
//        catch{
//            print("Error: \(error)")
//        }
//    }



#Preview {
    CrashView().modelContainer(for: CatData.self, inMemory: false)
}
