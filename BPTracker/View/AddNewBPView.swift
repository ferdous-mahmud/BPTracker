//
//  AddNewBPView.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 2/21/24.
//

import SwiftUI

struct AddNewBPView: View {
    
    @State var selectedDate = Date.now
    @State var isTakePill = true
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                Text("Add New Record")
                    .bold()
                    .font(.title2)
                Spacer()
            }
            .padding(.vertical)
            
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    Text("SYS/mmHG")
                        .bold()
                        .font(.subheadline)
                        .padding(.top)
                    CustomBPPicker()
                }
                VStack(spacing: 0) {
                    Text("DIA/mmHG")
                        .bold()
                        .font(.subheadline)
                        .padding(.top)
                    CustomBPPicker()
                }
                VStack(spacing: 0) {
                    Text("Pulse/bmP")
                        .bold()
                        .font(.subheadline)
                        .padding(.top)
                    CustomBPPicker()
                }
            }
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            
            Toggle(isOn: .constant(true), label: {
                Text("SHOW SHOW CALCULATED RESULT HERE")
                    .bold()
                    .font(.title3)
            })
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .padding(.vertical)
            
            Toggle(isOn: $isTakePill, label: {
                Text("Take Pills?")
                    .bold()
                    .font(.title3)
            })
            .tint(Color("AccentColor"))
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            
            DatePicker(selection: $selectedDate, label: {
                Text("Date")
                    .bold()
                    .font(.title3)
            })
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .padding(.vertical)
      
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    AddNewBPView()
}
