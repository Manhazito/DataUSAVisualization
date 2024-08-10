//
//  DialogView.swift
//  DataUSAVisualization
//
//  Created by Filipe Ramos on 10/08/2024.
//

import SwiftUI

struct DialogView: View {
    @Binding var show: Bool
    var title: String
    var message: String
    
    var body: some View {
        Group {
            if show {
                ZStack {
                    Color(.black).opacity(0.3)
                    
                    VStack {
                        Text(title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.systemBackground))
                            .minimumScaleFactor(0.8)
                            .padding()
                        
                        Text(message)
                            .font(.title3)
                            .lineLimit(2)
                            .foregroundStyle(Color(.systemBackground))
                            .minimumScaleFactor(0.8)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Button("OK") {
                            show.toggle()
                        }
                        .foregroundStyle(Color(.systemBackground))
                        .padding()
                        .padding(.bottom, 4)
                    }
                    .containerRelativeFrame(.horizontal) { length, _ in
                        length - 32
                    }
                    .frame(height: 200)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .shadow(color: Color(.systemBackground), radius: 4)
                }
                .ignoresSafeArea()
            }
        }
    }
}

#Preview {
    DialogView(show: .constant(true), title: "Title", message: "This is a mtest message")
}
