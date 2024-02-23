//
//  CustomNumberImputField.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 23/2/24.
//

import SwiftUI

struct CustomBPPicker: View {
 
    @Binding var selectedValue: Int
    let valueRange: ClosedRange<Int>
    let pickerTitle: String
    
    init(selectedValue: Binding<Int>, valueRange: ClosedRange<Int>, pickerTitle: String = "Picker") {
        self._selectedValue = selectedValue
        self.valueRange = valueRange
        self.pickerTitle = pickerTitle
    }
    
    var body: some View {
        Picker(pickerTitle, selection: $selectedValue) {
            ForEach(valueRange, id: \.self) { value in
                Text("\(value)")
                    .tag(value)
                    .bold()
                    .font(.title2)
                    .foregroundColor(.gray)
            }
        }
        .pickerStyle(.wheel)
        .frame(height: 150)
        .background(.thickMaterial)
    }
}

#Preview {
    CustomBPPicker(selectedValue: .constant(120), valueRange: 100...120)
}
