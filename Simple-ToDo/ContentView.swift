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
        .frame(maxWidth: .infinity, idealHeight: 35)
        .padding(10)
        .border(.black, width: 1.5)
        .cornerRadius(2)
    }
}

struct AddItemButtonView: View {
    @State var shouldShowAlert: Bool = false
    
    var body: some View {
        HStack {
            Spacer()
            Button() {
                shouldShowAlert.toggle()
            } label: {
                Image(systemName: "plus")
                    .resizable(resizingMode: .stretch)
                        
            }
            .frame(width: 50, height: 50, alignment: .trailing)
            .padding()
            .background(.blue)
            .foregroundColor(Color(white: 0.95))
            .clipShape(Circle())
            .overlay(Circle()
                .stroke(.black, lineWidth: 0.35)
            )
            .shadow(color: .gray, radius: 0.9, x: 1, y: 3)
            .alert(isPresented: $shouldShowAlert) {
                Alert(title: Text("Add item to list"))
            }
        }
        .padding()
    }
}

struct ContentView: View {
    var body: some View {
            ScrollView() {
                ForEach(0..<10) { _ in
                    ListEntry()
                }
            }
            .padding(.horizontal, 9)
            .padding(.top, 5)
            .padding(.bottom, 0)
            .border(.black, width: 1.5)
            .cornerRadius(2)
            .padding(5)
        AddItemButtonView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
