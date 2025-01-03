//
//  ContentView.swift
//  Ailuro
//
//  Created by Sophie Cheng on 12/28/24.
//

import SwiftUI
import SwiftData

struct CircularTextView: View {
    @State private var letterWidths: [Int:Double] = [:]
    //declares variable but doesn't assign value
    @State var title: String
    
    var lettersOffset: [(offset: Int, element: Character)] {
        return Array(title.enumerated())
    }
    var radius: Double
    
    var degrees: Double
    
    var kerning: Double
    
    var body: some View {
        ZStack {
            ForEach(lettersOffset, id: \.offset) { index, letter in
                VStack {
                    Text(String(letter))
                        .kerning(kerning) //kerning = space btwn letters
                        .background(LetterWidthSize())
                        .onPreferenceChange(WidthLetterPreferenceKey.self, perform: { width in
                            letterWidths[index] = width
                        })
                    Spacer()
                }
                .rotationEffect(fetchAngle(at: index))
            }
        }
        .rotationEffect(.degrees(degrees))
    }
    
    func fetchAngle(at letterPosition: Int) -> Angle {
        let times2pi: (Double) -> Double = { $0 * 2 * .pi }
        
        let circumference = times2pi(radius)
                        
        let finalAngle = times2pi(letterWidths.filter{$0.key <= letterPosition}.map(\.value).reduce(0, +) / circumference)
        
        return .radians(finalAngle)
    }
}

struct WidthLetterPreferenceKey: PreferenceKey {
    static var defaultValue: Double = 0
    static func reduce(value: inout Double, nextValue: () -> Double) {
        value = nextValue()
    }
}

struct LetterWidthSize: View {
    var body: some View {
        GeometryReader { geometry in // using this to get the width of EACH letter
            Color
                .clear
                .preference(key: WidthLetterPreferenceKey.self,
                            value: geometry.size.width)
        }
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @State var rotationA = 0.0
    @State var rotationB = 0.0
    @State var rotationC = 0.0
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                Rectangle()
//                    .fill(Color.yellow) //TODO: temp
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 500, alignment: .center)
                    .opacity(0.0)
                    .overlay(
                        NavigationLink(destination: CrashView()){
                            ZStack{
                                CircularTextView(title: "AI's footprint", radius: 120, degrees: -35, kerning: 2)
                                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                                    .shadow(color: .black, radius: 6)
                                    .foregroundColor(Color.white)
                                    .frame(width: 295, height: 295)
//                                    .padding()
                                    .zIndex(5)
                                Image("ailuroCrash")
                                //.fill(Color.blue)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 250)
                                    .padding()
                                    .shadow(color: Color.blue, radius: 10, x: 0.0, y: 5.0)
                                    .rotationEffect(.degrees(rotationA))
                                    .onAppear{
                                        withAnimation(.linear(duration: 100).repeatForever(autoreverses: false)){
                                            rotationA = 360
                                        }
                                    }
                            }
                        }
                        , alignment: .bottomLeading
                            )
                        
                Rectangle()
//                    .fill(Color.purple) //TODO: temp
                    .frame(minWidth: 500, maxWidth: 600, minHeight: 0, maxHeight: 300, alignment: .topTrailing)
                    .opacity(0.0)
                    .overlay(
                        NavigationLink(destination: WorldView()){
                            ZStack{
                                CircularTextView(title: "AI for better earth", radius: 150, degrees: -70, kerning: 5)
                                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                                    .shadow(color: .black, radius: 6)
                                    .foregroundColor(Color.white)
                                    .frame(width: 220, height: 230)
                                    .padding()
                                    .zIndex(5)
                                Image("ailuroWorld")
                                //.fill(Color.green)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 175)
                                    .padding()
                                    .shadow(color: Color.blue, radius: 10, x: 0.0, y: 7.0)
                                    .opacity(0.9)
                                    .rotationEffect(.degrees(rotationB))
                                    .onAppear{
                                        withAnimation(.linear(duration: 50).repeatForever(autoreverses: false)){
                                            rotationB = -360
                                        }
                                    }
                            }
                        }
                        , alignment: .trailing
                    )
                Rectangle()
                    .frame(minWidth: 0, maxWidth: 370, minHeight: 0, maxHeight: 600, alignment: .center)
                    .opacity(0.0)
                    .overlay(
                        NavigationLink(destination: ChatView()){
                            ZStack{
                                CircularTextView(title: "Planet AI-LURO", radius: 120, degrees: -30, kerning: 5)
                                    .font(.system(size: 17, weight: .bold, design: .monospaced))
                                    .shadow(color: .black, radius: 6)
                                    .foregroundColor(Color.white)
                                    .frame(width: 160, height: 180)
                                    .padding()
                                    .zIndex(5)
                                Image("ailuroCat")
                                //.fill(Color.pink)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120)
                                    .padding()
                                //.shadow(color: Color.cyan, radius: 10, x: 0.5, y: 7.0)
                                    .rotationEffect(.degrees(rotationC))
                                    .onAppear{
                                        withAnimation(.linear(duration: 10).repeatForever()){
                                            rotationC = -45
                                        }
                                    }
                            }
                        }
                        , alignment: .bottomTrailing
                    )
                
                VStack{
                    VStack {
                        Image(systemName: "cat")
                            .imageScale(.large)
                            .foregroundStyle(.yellow)
                            .fontWeight(.semibold)
                            .padding(.bottom, 1)
                        Text("A I L U R O")
                            .foregroundStyle(.yellow)
                            .fontWeight(.heavy)
                            .font(.system(size: 25, design: .monospaced))
                    }
                    
                    VStack(alignment: .leading){
                        Text("How does the ")
                        + Text("prospect of AI ")
                            .foregroundStyle(Color(#colorLiteral(red: 0.4096409678, green: 0.7533833385, blue: 0.6715200543, alpha: 1)))
                        + Text("impact the ")
                        + Text("world we live in?")
                            .foregroundStyle(Color.yellow)
                        Text("\nClick on a planet to begin!")
                            .foregroundStyle(Color(#colorLiteral(red: 0.4096409678, green: 0.7533833385, blue: 0.6715200543, alpha: 1)))
                            .italic()
                    }
                    .frame(width: 200)
                    .lineLimit(10)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    Spacer()
                        NavigationLink("What's AI?", destination: CrashView())
                            .foregroundStyle(.yellow)
                }
//                Image("ailuroDraft")
//                    .resizable()
//                    .scaledToFit()
//                    .opacity(1.0)
            }
            .font(.system(size: 18, weight: .light, design: .monospaced))
            //STACK WIDE FONT STYLE!
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView().modelContainer(for: CatData.self, inMemory: false)
}
