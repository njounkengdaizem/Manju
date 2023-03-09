//
//  ContentView.swift
//  Manju
//
//  Created by Daize Njounkeng on 3/4/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            ViewA()
                .badge(10)
                .tabItem(){
                    Image(systemName: "ellipsis.message")
                    Text("Chat")
                }
               
            ViewB()
            
                .tabItem(){
                    Image(systemName: "mic.circle")
                    Text("Speak")
                }
            ViewC()
                .tabItem(){
                    Image(systemName: "slider.horizontal.3")
                    Text("More")
                }
        }.tabViewStyle(DefaultTabViewStyle())
            .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
