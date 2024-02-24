//
//  AnalyticsView.swift
//  BPTracker
//
//  Created by Ferdous Mahmud Akash on 2/21/24.
//

import SwiftUI
import Charts

struct AnalyticsView: View {
    @ObservedObject var vm: BPViewModel = BPViewModel()
    
    var body: some View {
        VStack {
            Text("Analytics")
                .bold()
                .font(.title)
            
            VStack {
                Chart(vm.bpList, id: \.id) { bp in
                    LineMark(
                        x: .value("Month", bp.date),
                        y: .value("SYS", bp.sysBP),
                        series: .value("", "Systolic")
                    )
                    .foregroundStyle(Color.blue)
                    
                    LineMark(
                        x: .value("Month", bp.date),
                        y: .value("DIA", bp.diaBP),
                        series: .value("", "Diastolic")
                    )
                    .foregroundStyle(Color.red)
                    
                    LineMark(
                        x: .value("Month", bp.date),
                        y: .value("Pulse", bp.pulse),
                        series: .value("", "Pulse")
                    )
                    .foregroundStyle(Color.green)
                    
                }
                .frame(height: 300)
                .padding()
                
            }
            .frame(maxWidth: 400, maxHeight: 350)
            .background(Color(.systemGray6))
            .padding(.horizontal)
            .onAppear {
                vm.getMockBPs()
            }
            
            VStack(spacing: 0) {
                HStack {
                    Rectangle()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(Color.blue)
                    
                    Text("Systolic Pressure")
                    Spacer()
                }
                
                HStack {
                    Rectangle()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(Color.red)
                    
                    Text("Diastolic Pressure")
                    Spacer()
                }
                
                HStack {
                    Rectangle()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(Color.green)
                    
                    Text("Pulse")
                    
                    Spacer()
                }
            }
            .padding()
            
            Spacer()
        }
        
    }
}

#Preview {
    AnalyticsView()
}
