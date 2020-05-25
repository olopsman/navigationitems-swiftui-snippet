//
//  ContentView.swift
//  NavigationBarItem-snippet
//
//  Created by Paulo Orquillo on 26/05/20.
//  Copyright © 2020 Quonsepto Limited. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showingAdd = false

    var addButton: some View {
        //Using sheet
        Button(action: {self.showingAdd.toggle()}) {
            Image(systemName: "plus.circle")
                .imageScale(.large)
                .accessibility(label: Text("Add"))
        }
    }
    
    var settingsButton: some View {
        //Using Navigation Link
        NavigationLink(destination: Text("Settings Page")){
            Image(systemName: "gear")
            .imageScale(.large)
            .accessibility(label: Text("Settings"))
            }
    }

    var body: some View {
        
        NavigationView {
            List {
                Section(header:
                    Text("Options")
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                ){
                    NavigationLink(destination: Text("Details")) {
                        Text("Show Details")
                    }
                }
            }
            .navigationBarItems(leading: settingsButton, trailing: addButton)
            .sheet(isPresented: $showingAdd){
                Text("Add View")
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Home"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
