//
//  NSCacheBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/19/25.
//

import SwiftUI

class CacheViewModel: ObservableObject {
    
    @Published var startingImage: UIImage? = nil
    let imageName: String = "steve-jobs"
    init() {
        getImageFromAsssetsFolder()
    }
    func getImageFromAsssetsFolder () {
        startingImage = UIImage(named: imageName)
    }
    
}


struct NSCacheBootcamp: View {
    
    @StateObject var vm = CacheViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = vm.startingImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
                }
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Text("Save to cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    })
                    Button(action: {
                        
                    }, label: {
                        Text("Delete from cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    })
                }

                Spacer()
            }
            .navigationTitle(Text("NSCache Bootcamp"))
        }
    }
}

#Preview {
    NSCacheBootcamp()
}
