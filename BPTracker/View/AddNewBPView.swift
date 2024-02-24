//
//  AddNewBPView.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 2/21/24.
//

import SwiftUI

struct AddNewBPView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: BPViewModel = BPViewModel()
    @State private var newBP = BPModel(sysBP: 120, diaBP: 80, pulse: 90, isTakaPill: true, date: Date.now)
    @State var conditon = BPCondition(name: "Normal", color: Color.green)
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                Text("Add New Record")
                    .bold()
                    .font(.title2)
                Spacer()
                
                Image(systemName: "xmark")
                    .bold()
                    .foregroundColor(.gray)
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        haptic(.success)
                        dismiss()
                    }
            }
            .padding(.vertical)
            
            HStack(spacing: 0) {
                VStack(spacing: 0) {
                    Text("SYS/mmHG")
                        .bold()
                        .font(.subheadline)
                        .padding(.top)
                        .foregroundColor(.white)
                    CustomBPPicker(selectedValue: $newBP.sysBP, valueRange: 10...300)
                        .background(.thickMaterial)
                }
                .onChange(of: newBP.sysBP) { newValue in
                    conditon = vm.getBloodPressureConditionString(systolic: newValue, diastolic: newBP.diaBP)
                }
                
                VStack(spacing: 0) {
                    Text("DIA/mmHG")
                        .bold()
                        .font(.subheadline)
                        .padding(.top)
                        .foregroundColor(.white)
                    CustomBPPicker(selectedValue: $newBP.diaBP, valueRange: 10...300)
                        .background(.thickMaterial)
                }
                .onChange(of: newBP.diaBP) { newValue in
                    conditon = vm.getBloodPressureConditionString(systolic: newBP.sysBP, diastolic: newValue)
                }
                
                VStack(spacing: 0) {
                    Text("Pulse/bmP")
                        .bold()
                        .font(.subheadline)
                        .padding(.top)
                        .foregroundColor(.white)
                    CustomBPPicker(selectedValue: $newBP.pulse, valueRange: 50...120)
                        .background(.thickMaterial)
                }
            }
            .background(Color("AccentColor"))
            .cornerRadius(10)
            
            HStack {
                Spacer()
                Text(conditon.name).bold()
                    .font(.title3)
                    .foregroundColor(conditon.color)
                Spacer()
            }
            .padding()
            .background(conditon.color.opacity(0.2))
            .cornerRadius(10)
            .padding(.vertical)
            
            Toggle(isOn: $newBP.isTakaPill, label: {
                Text("Take Pills?")
                    .foregroundColor(.gray)
                    .bold()
                    .font(.title3)
            })
            .tint(Color("AccentColor"))
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            
            DatePicker(selection: $newBP.date, in: ...Date(), label: {
                Text("Date")
                    .foregroundColor(.gray)
                    .bold()
                    .font(.title3)
            })
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .padding(.vertical)
            
            PrimaryButton(title: "Add", onTap: {
                if vm.addNewBP(newBP: self.newBP) {
                    dismiss()
                } else {
                    print("Show error alert")
                }
            })
      
            Spacer()
        }
        .padding(.horizontal)
    }
    
}

#Preview {
    AddNewBPView()
}
