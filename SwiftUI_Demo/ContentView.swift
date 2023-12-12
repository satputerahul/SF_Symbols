//
//  ContentView.swift
//  SwiftUI_Demo
//
//  Created by DevMAC01 on 02/12/23.
//

import SwiftUI

struct ContentView: View {
    
    var activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]
    
    @State var selected = "Baseball"
    @State private var id = 1
    @State private var circleColor = Color.accentColor

    
    var body: some View {
        
        ScrollView{
            VStack{
                Text("SF_Symbols")
                    .font(.largeTitle)
                    .bold()
                
                
                VStack{
                    Circle()
                        .fill(circleColor)
                        .padding()
                        .overlay(
                            Image(systemName: "figure.\(selected.lowercased())")
                                .font(.system(size: 144))
                                .foregroundStyle(.orange)
                        )
                        .transition(.slide)
                        .id(id)
                    
                    Text("\(selected)!")
                        .font(.largeTitle.bold())
                        .italic()
                        .underline()
                }
                .onTapGesture {
                                    circleColor = Color(.sRGB, red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), opacity: 1)
                                }
            }
            .gesture(
                DragGesture().onChanged { _ in
                    circleColor = Color(.sRGB, red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), opacity: 1)
                    
                    selected = activities.randomElement() ?? "Archery"
                    id += 1
                }
            )
            Button("Press"){
                withAnimation(.easeInOut(duration: 1)){
                    selected = activities.randomElement() ?? "Archery"
                    id += 1
                }
                circleColor = Color(.sRGB, red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), opacity: 1)

            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
            .foregroundColor(.black)
            .font(.largeTitle)
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
