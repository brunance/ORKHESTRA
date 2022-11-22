//
//  CircularProgressView.swift
//  orkhestraWatch Watch App
//
//  Created by Bruno França do Prado on 18/11/22.
//

import SwiftUI

struct CircularProgressView: View {
    let progress: Double
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    lineWidth: 7
                )
                .background(Color.white)
                .cornerRadius(50)
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    Color("Destaque1"),
                    style: StrokeStyle(
                        lineWidth: 7,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)

        }
    }
}
