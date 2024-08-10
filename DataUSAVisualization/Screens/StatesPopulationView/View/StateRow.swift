//
//  StateRow.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 10/08/2024.
//

import SwiftUI

struct StateRow: View {
    var stateData: StateData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(stateData.id)
                    .resizable()
                    .frame(width: 80, height: 80)
                
                VStack(alignment: .leading) {
                    Text(stateData.name)
                        .font(.title3)

                    ZStack(alignment: .leading) {
                        Color(.accent)
                            .containerRelativeFrame(.horizontal) { length, _ in
                                (length - 88 - 38) * stateData.relativePopulation
                            }
                            .frame(height: 20)
                        
                        Text("\(stateData.population)")
                            .font(.subheadline)
                            .padding(.horizontal, 6)
                    }
                }
            }
            .padding(.horizontal, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.horizontal)
        .background(.accent.opacity(0.1))
    }
}

#Preview {
    Group {
        StateRow(
            stateData: StateData(
                id: "texas",
                name: "Texas",
                year: "2024",
                population: 11_234_432,
                relativePopulation: 0.75
            )
        )
        StateRow(
            stateData: StateData(
                id: "california",
                name: "California",
                year: "2024",
                population: 11_234_432,
                relativePopulation: 1.0
            )
        )
    }
}
