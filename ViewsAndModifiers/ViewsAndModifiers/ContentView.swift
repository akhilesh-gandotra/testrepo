//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Akhilesh Gandotra on 02/03/20.
//  Copyright © 2020 Akhilesh Gandotra. All rights reserved.
//

import SwiftUI

struct CapsuleView:  View {
    var text: String
    var body: some View {
        Text(text).padding()
        .foregroundColor(.red)
        .background(Color.yellow)
        .clipShape(Circle())
    }
}


struct Title: ViewModifier  {
    func body(content: Content) -> some View {
        content.foregroundColor(.blue).padding()
            .background(Color.green)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct ContentView: View {
    
    @State private var useRed: Bool = false
    
    private var text1 = Text("first view")
    private var text2 = Text("second view")
    
    var body: some View {
//        GridStack(columns: 3, rows: 4) { (row, column) in
//            ZStack(alignment: .center) {
//                Color.black
//                CapsuleView(text: "\(row) \(column)")
//            }
//        }
        Text("This is a title").setLargeBlueTitle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct GridStack<Content: View>: View {
    var columns: Int
    var rows: Int
    var content: (Int, Int) -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}


struct LargeBlueFont: ViewModifier {
    
     func body(content: Content) -> some View {
      return  content.font(.largeTitle).foregroundColor(.blue)
    }
}
extension View {
    func setLargeBlueTitle() -> some View {
        self.modifier(LargeBlueFont())
    }
}
