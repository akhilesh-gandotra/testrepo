//
//  ContentView.swift
//  Animations
//
//  Created by Akhilesh Gandotra on 21/04/20.
//  Copyright © 2020 Akhilesh Gandotra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    @State private var showRectangle = false
    @State private var string = Array("Hello SwiftUI")
    
    
   
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<string.count) { num in
                    Text(String(self.string[num])).padding(5).font(.title).foregroundColor(.white).background(self.enabled ? Color.red : Color.blue).offset(self.dragAmount)
                        .animation(Animation.default.delay(Double(num) / 20))
                }
            }.gesture(
                DragGesture().onChanged{
                    self.dragAmount = $0.translation
                }.onEnded({ _ in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                    withAnimation {
                        self.showRectangle.toggle()
                    }
                    
                    
                })
            )
            if showRectangle {
                Rectangle().frame(width: 200, height: 200).transition(.pivot)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}
struct CornerRotateModifier: ViewModifier {
       let amount: Double
       let anchor: UnitPoint
       
       func body(content: Content) -> some View {
           content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
       }
   }
   
   
