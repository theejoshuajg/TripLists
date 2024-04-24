//
//  AddTripView.swift
//  MidTermExam_Q2
//
//  Created by George, Joshua on 3/26/24.
//

import SwiftUI

struct AddTripView: View {
    @State private var name:String = ""
    @State var selectedDate: Date = Date()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Text("Please enter needed information below").font(.system(size: 32))
                TextField("Name of Trip", text:$name)
                DatePicker("Select Date", selection: $selectedDate)
                    .padding(.horizontal)
                Button("Submit") {}
            }.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Exit") {
                        dismiss()
                    }.buttonStyle(.bordered)
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)        .frame(width:350)
        }
        .accentColor(.yellow)
    }
}

#Preview {
    AddTripView()
}
