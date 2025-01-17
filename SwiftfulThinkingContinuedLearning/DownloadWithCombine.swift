//
//  DownloadWithCombine.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/17/25.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
        
    }
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        /* Combine Discussion
             1. Sign up for monthly subscription for package to be delivered
             2. The vcompany would make hte package behind the scenes
             3. Receive the packate at your front door
             4. Make sure the box isn't damaged
             5. Open and make sure the item is correct
             6. Use the item
             7. Cancellable at any time
         
            1. Create the publisher
            2. Subscribe publisher on the background thread
            3. Receive on main thread
            4. tryMap (Check that the data is good)
            5. decode (Decode data into PostModel)
            6. sink (Put hte item into our app)
            7. store (Cancel subscription if needed)
         */
        
        
        URLSession.shared.dataTaskPublisher(for: url)                   // 1. Create the publisher
            .subscribe(on: DispatchQueue.global(qos: .background))      // 2. Subscribe the publisherf on background thread
            .receive(on: DispatchQueue.main)                            // 3. Recieve on main thread
            .tryMap(handleOutput)                                       // 4. tryMap (Check that the data is good)
            .decode(type: [PostModel].self, decoder: JSONDecoder())     // 5. Decode (Decode data into PostModel)
            .sink(receiveCompletion: { (completion) in                  // 6. sinc (Put the item into the app
                print("COMPLETION: \(completion)")
            }, receiveValue: { [weak self] ( returnedPosts ) in
                self?.posts = returnedPosts
            })
            .store(in: &cancellables)                                   // 7. Store (Cancel subscription if needed)
    }
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
                throw URLError(.badServerResponse)
        }
        return output.data
    }
}

struct DownloadWithCombine: View {
    
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack (alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    DownloadWithCombine()
}
