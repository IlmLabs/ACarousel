//
//  ProgressBar.swift
//  
//
//  Created by Ridwan Al-Mansur on 20/05/2023.
//

import SwiftUI

struct ProgressBar: View {
    
    @State private var progressWidth: CGFloat = 0
    @State private var progressBarId = 0
    
    @Binding var activeIndex: Int
    var interval: TimeInterval
    var barTint: Color

    public init(
        activeIndex: Binding<Int>,
        interval: TimeInterval,
        barTint: Color
    ) {
        self._activeIndex = activeIndex
        self.interval = interval - 1
        self.barTint = barTint
    }

    var body: some View {
        ZStack(alignment: .leading) {
            // Background
            Rectangle()
                .fill(barTint.opacity(0.3))
            
            // Fill
            Rectangle()
                .fill(barTint)
                .id(progressBarId)
                .animation(.linear(duration: interval), value: progressWidth)
                .frame(maxWidth: progressWidth)
        }
        .frame(height: 4)
        .frame(minWidth: 0, maxWidth: .infinity)
        .onAppear {
            withAnimation {
                progressWidth = .infinity
            }        }
        .onChange(of: activeIndex) { _ in
            resetProgress()
        }
    }
    
    private func resetProgress() {
        progressWidth = 0
        progressBarId += 1
        
        withAnimation {
            progressWidth = .infinity
        }
    }
}
