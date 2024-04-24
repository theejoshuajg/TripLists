//
//  ContentView.swift
//  MidTermExam_Q2
//
//  Created by George, Joshua on 3/26/24.
//

import SwiftUI

var trips:[Trips] = [.init(name: "New York Trip", duration: "April 24 - May 6", info: "Day 1 we will do blah blah blah blah"), .init(name: "West Coast Trip", duration: "May 19 - May 25", info: "Day 1 we will do blah blah blah blah"), .init(name: "Hawaii Trip", duration: "June 13 - June 21", info: "Day 1 we will do blah blah blah blah"), .init(name: "Paris Trip", duration: "June 24 - July 6", info: "Day 1 we will do blah blah blah blah"), .init(name: "Tokyo Trip", duration: "July 12 - August 6", info: "Day 1 we will do blah blah blah blah"), .init(name: "Camping Trip", duration: "August 10 - August 13", info: "Day 1 we will do blah blah blah blah")]

struct ContentView: View {
    
    @State private var path:[Trips] = []
    @State private var clicked:Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack(path: $path){
            List{
                Section("Upcoming Trips"){
                    ForEach(trips, id:\.name){
                        trip in
                        NavigationLink(value: trip){
                            Label(trip.name, systemImage: "mappin.and.ellipse")
                            Text(trip.duration).font(.system(size: 12))
                        }
                    }
                    Button("Add Trip") {
                        clicked.toggle()
                    }
                }

            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Exit") {
                        dismiss()
                    }.buttonStyle(.bordered)
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)        .frame(width:350)
            .navigationTitle("My Trips")
            .navigationDestination(for: Trips.self) { trip in
                VStack {
                    Text(trip.name).font(.system(size: 35))
                    Text(trip.duration).font(.system(size: 15))
                    Text(trip.info)
                }.padding()
                Spacer()
                Button("Edit") {
                    
                }.padding()
            }
        }.accentColor(.yellow)
            .fullScreenCover(isPresented: $clicked) {
            AddTripView()
        }
    }
}

#Preview {
    ContentView()
}

struct Trips:Hashable{
    let name:String
    let duration:String
    let info:String
}


