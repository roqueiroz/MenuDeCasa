//
//  ContentView.swift
//  MenuDeCasa
//
//  Created by Rodrigo Queiroz on 09/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowing = false
    var body: some View {
        NavigationView {
            ZStack {
                if isShowing {
                    SideMenuView(isShowing: $isShowing)
                }
                HomeView()
                    .cornerRadius(isShowing ? 20 : 0)
                    .offset(x: isShowing ? 270 : 0, y: isShowing ? 40 : 0)
                    .scaleEffect(isShowing ? 0.9 : 1)
                    .navigationBarItems(leading: Button(action: {
                        withAnimation(.spring) {
                            isShowing.toggle()
                        }
                    }, label: {
                        Image(systemName: "list.bullet")
                            .foregroundStyle(.black)
                    }))
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear {
                isShowing = false
            }
        }
    }
}

#Preview {
    ContentView()
}

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(.white)
            Text("Olá, vc esta na home")
                .padding()
        }
    }
}
