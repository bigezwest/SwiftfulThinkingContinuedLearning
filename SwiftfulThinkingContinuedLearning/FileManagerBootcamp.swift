//
//  FileManagerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/17/25.
//

import SwiftUI

struct FileManagerBootcamp: View {
    
    class FileManagerViewModel: ObservableObject {
        @Published var image: UIImage? = nil
        let imageName: String = "steve-jobs"
        init() {
            getImageFromAssetsFolder()
        }
        func getImageFromAssetsFolder() {
            image = UIImage(named: imageName)
        }
    }
    
    var body: some View {
        @State var vm = FileManagerViewModel()
        NavigationView {
            VStack {
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                Button {
                    
                } label: {
                    Text("Save to FM")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .navigationTitle("File Manager")
            
        }
    }
}

#Preview {
    FileManagerBootcamp()
}
