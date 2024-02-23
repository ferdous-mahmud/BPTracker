//
//  CustomNumberImputField.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 23/2/24.
//

import SwiftUI

struct CustomBPPicker: View {

    @State private var selectedSystolic =  120
    
    var body: some View {
        let systolicValues = Array(100...200)
        
        Picker("Systolic", selection: $selectedSystolic) {
            ForEach(systolicValues, id: \.self) { value in
                Text("\(value)").tag(value)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.gray)
            }
        }
        .pickerStyle(.wheel)
        .frame(height: 150)
    }
}

#Preview {
    CustomBPPicker()
}
