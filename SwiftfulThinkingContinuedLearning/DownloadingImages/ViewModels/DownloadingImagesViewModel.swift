//
//  DownloadingImagesViewModel.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/19/25.
//

import Foundation

class DownloadingImagesViewModel: ObservableObject {

    @Published var dataArray: [PhotoModel] = []
    
    let dataService = PhotoModelDataService.instance
    
}
