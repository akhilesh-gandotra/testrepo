//
//  ContentView.swift
//  Landmarks
//
//  Created by Akhilesh Gandotra on 24/02/20.
//  Copyright © 2020 Akhilesh Gandotra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("New Delhi").font(.title).foregroundColor(.red)
            HStack {
                Text("Delhi National Park ").font(.subheadline)
                Spacer()
                Text("Chattarpur").font(.subheadline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
