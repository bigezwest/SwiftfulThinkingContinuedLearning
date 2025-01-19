//
//  DownloadingImagesRow.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/19/25.
//

import SwiftUI

struct DownloadingImagesRow: View {
    
    let model: PhotoModel
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 75, height: 75)
            VStack {
                Text(model.title)
                    .font(.headline)
                Text(model.url)
                    .foregroundColor(.gray)
                    .italic()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    DownloadingImagesRow(
        model: PhotoModel(albumId: 1, id: 1, title: "Title", url: "URL here", thumbnailUrl: "Thumbnail Here")
    )
}
