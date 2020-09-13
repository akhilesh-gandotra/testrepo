//
//  ContentView.swift
//  WeSplit
//
//  Created by Akhilesh Gandotra on 24/02/20.
//  Copyright © 2020 Akhilesh Gandotra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var enterAmt = ""
    @State private var checkoutAmt = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    @State private var isTipZero = false
    @State private var alertShow = false
    
    private var totalAmt: Double {
        guard let amt = Double(self.enterAmt) else {
            return 0
        }
        return (amt + (Double(tipPercentages[tipPercentage]) * amt * 0.01 ))
    }
    
    private var amountPerPerson: Double {
        return self.totalAmt/Double(numberOfPeople+2)
    }
    
    var tipPercentages = [0,10,15,20,25]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $enterAmt).keyboardType(.decimalPad)

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<10) {
                            Text("\($0) people")
                        }
                    }
                }

                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {

                    Text("$\(amountPerPerson, specifier: "%.2f")").foregroundColor(tipPercentage == 0 ? .red : .black)
                }
            }.navigationBarTitle("We Split")
        }
       
//        LinearGradient(gradient: Gradient(colors: [.white,.black,.yellow]), startPoint: .top, endPoint: .bottom)
//        Button(action: {
//            self.alertShow = true
//        }) {
//            Text("Tap")
//        }.alert(isPresented: $alertShow, content:  {
//            Alert(title: Text("SJS"), message:Text("SJS"), dismissButton: .cancel(Text("Ijsdk"), action: {
//                print("huhuhuh")
//
//            }))
//        })
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

