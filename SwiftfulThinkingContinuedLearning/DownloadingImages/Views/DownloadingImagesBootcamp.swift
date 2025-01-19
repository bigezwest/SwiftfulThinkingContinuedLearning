//
//  DownloadingImagesBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/19/25.
//

import SwiftUI

struct DownloadingImagesBootcamp: View {
    
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.dataArray) { model in
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
            .navigationTitle("Downloading Images")
        }
    }
}

#Preview {
    DownloadingImagesBootcamp()
}
