//
//  FileManagerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/17/25.
//

import SwiftUI

class LocalFileManager {
    static let instance = LocalFileManager()
    func saveImage(image: UIImage, name: String) {
        guard let date = image.jpegData(compressionQuality: 1.0) else {
            print("Error getting data.")
            return
        }
        let directory = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )
        let directory2 = FileManager.default.urls(
            for: .cachesDirectory,
            in: .userDomainMask
        )
        let directory3 = FileManager.default.temporaryDirectory
        print(directory)
        print(directory2)
        print(directory3)
//        data.write(to: )
    }
}

class FileManagerViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let imageName: String = "steve-jobs"
    let manager = LocalFileManager.instance
    
    init() {
        getImageFromAssetsFolder()
    }
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    func saveImage() {
        guard let image = image else { return }
        manager.saveImage(image: image, name: imageName)
    }
}

struct FileManagerBootcamp: View {
        
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
                    vm.saveImage()
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
