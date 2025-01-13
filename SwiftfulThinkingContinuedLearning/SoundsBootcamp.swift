//
//  SoundsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/13/25.
//

import SwiftUI

class SoundManager {
    // Make the soundManager available to use in any view in the app.
    static let instance = SoundManager()
    
    
}

struct SoundsBootcamp: View {

    var body: some View {
        VStack (spacing: 40) {
            
            Button("Play Sound 1") {
                
            }
            
            Button("Play Sound 2") {
                
            }
        }
    }
}

#Preview {
    SoundsBootcamp()
}
