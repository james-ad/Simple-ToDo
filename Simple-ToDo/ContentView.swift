//
//  ContentView.swift
//  Simple-ToDo
//
//  Created by James Dunn on 5/31/23.
//

import SwiftUI

struct ListEntry: View {
    @State var isOn: Bool = false
    var body: some View {
        HStack {
            Text("Hola, World!")
            Spacer()
            Image(systemName: isOn ? "checkmark.square" : "square")
                .onTapGesture {
                    isOn.toggle()
                }
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .border(.black, width: 2)
        .cornerRadius(10)
    }
}
struct ContentView: View {
    var body: some View {
        ScrollView() {
            ForEach(0..<10) { _ in
                ListEntry()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
