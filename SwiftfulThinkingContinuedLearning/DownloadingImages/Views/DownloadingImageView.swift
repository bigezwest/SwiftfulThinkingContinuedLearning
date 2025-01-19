//
//  DownloadingImageView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/19/25.
//

import SwiftUI

struct DownloadingImageView: View {
    
    @State var isLoading: Bool = true
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
            } else {
                Circle()
            }
        }
    }
}

#Preview {
    DownloadingImageView()
        .frame(width:75, height: 75)
}
