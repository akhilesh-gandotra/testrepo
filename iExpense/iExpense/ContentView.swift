//
//  ContentView.swift
//  iExpense
//
//  Created by Akhilesh Gandotra on 27/04/20.
//  Copyright © 2020 Akhilesh Gandotra. All rights reserved.
//

import SwiftUI


struct SecondView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
                
            }
            Text("Say hi to second view").gesture(TapGesture().onEnded{
                withAnimation(.default) {
                    self.presentationMode.wrappedValue.dismiss()
                }
                
            })
        }
    }
}

class User: ObservableObject {
    @Published var firstName: String
    @Published var lastName: String
    
    init() {
        firstName = "Akhilesh"
        lastName = "Gandotra"
    }
}
struct ContentView: View {
    @ObservedObject private var user = User()
    @State private var presentSheet = false
    @State private var numbers = [Int]()
    
    var body: some View {
        VStack {
            List {
               ForEach(numbers, id: \.self) {
                    Text("\($0)")
                }
                .onDelete(perform: delete)
            }
            Button("Add Number") {
                self.numbers.append(self.numbers.count + 1)
            }
            
        }
    }
    func delete(indexSet: IndexSet) {
        numbers.remove(atOffsets: indexSet)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
