//
//  HomeScreenView.swift
//  MidTermExam_Q2
//
//  Created by George, Joshua on 3/26/24.
//

import SwiftUI

struct HomeScreenView: View {
    @State private var logIn:Bool = false
    
    @FocusState private var focus:Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to BeeVoyage").font(.system(size: 32))
                Button("View Trips") {
                    focus = false
                    logIn.toggle()
                }
                .buttonStyle(.borderedProminent)
                .foregroundColor(.black)
                .accentColor(.yellow)
            }
            .padding()
            .fullScreenCover(isPresented: $logIn) {
                ContentView()
            }
        }
        
    }
}

#Preview {
    HomeScreenView()
}

