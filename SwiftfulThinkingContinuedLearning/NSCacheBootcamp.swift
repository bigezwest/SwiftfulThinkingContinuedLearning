//
//  NSCacheBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/19/25.
//

import SwiftUI

class CacheManager {
    static let instance = CacheManager() // Singleton
    
    private init() { }
    
    var imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    func add(image: UIImage, name: String) {
        imageCache.setObject(image, forKey: name as NSString)
        print("Added to cache")
    }
    func remove(name: String) {
        imageCache.removeObject(forKey: name as NSString)
        print("Removed from cache")
    }
    func get(name: String) -> UIImage? {
        return imageCache.object(forKey: name as NSString)
    }
    
}

class CacheViewModel: ObservableObject {
    
    @Published var startingImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    let imageName: String = "steve-jobs"
    let manager = CacheManager.instance
    
    init() {
        getImageFromAsssetsFolder()
    }
    func getImageFromAsssetsFolder () {
        startingImage = UIImage(named: imageName)
    }
    func savedToCache() {
        guard let image = startingImage else { return }
        manager.add(image: image, name: imageName)
    }
    func removeFromCache() {
        manager.remove(name: imageName)
    }
    func getFromCache() {
        cachedImage = manager.get(name: imageName)
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
                        vm.savedToCache( )
                    }, label: {
                        Text("Save to cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    })
                    Button(action: {
                        vm.removeFromCache( )
                    }, label: {
                        Text("Delete from cache")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    })
                }
                Button(action: {
                    vm.getFromCache( )
                }, label: {
                    Text("Get from cache")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                })
                if let image = vm.cachedImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .cornerRadius(10)
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
