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
                    DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images!")
        }
    }
}

#Preview {
    DownloadingImagesBootcamp()
}
