//
//  TypealiasBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/15/25.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypealiasBootcamp: View {
    
//    @State var item: MovieModel = MovieModel(
//        title: "Fantozzi",
//        director: "Paolo Villaggio",
//        count: 99
//    )
    @State var item: TVModel = TVModel(
        title: "Fantozzi (TV)",
        director: "Paolo Villaggio",
        count: 1000
    )
    
    var body: some View {
        VStack (alignment: .leading) {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

#Preview {
    TypealiasBootcamp()
}
