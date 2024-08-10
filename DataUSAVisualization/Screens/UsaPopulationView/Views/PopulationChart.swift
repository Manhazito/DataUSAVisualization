//
//  PopulationChart.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 10/08/2024.
//

import SwiftUI
import Charts

struct PopulationChart: View {
    @Binding var nationalData: [NationalData]
    
    var body: some View {
        GroupBox {
            Chart(nationalData, id: \.year) { data in
                LineMark(
                    x: .value("Date", data.yearDate ?? Date(), unit: .year),
                    y: .value("Population", data.population)
                )
            }
            .foregroundStyle(.accent)
            .chartYScale(domain: 300_000_000...350_000_000)
            .frame(height: 350)
        }
        .padding(.vertical, 24)
        .backgroundStyle(.accent.opacity(0.1))

    }
}

#Preview {
    PopulationChart(nationalData: .constant([
        NationalData(nation: "USA", year: "2022", population: 305_000_000),
        NationalData(nation: "USA", year: "2023", population: 315_000_000),
        NationalData(nation: "USA", year: "2024", population: 335_000_000)
    ]))
}
