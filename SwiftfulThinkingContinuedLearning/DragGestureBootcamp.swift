//
//  DragGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/12/25.
//

import SwiftUI

struct DragGestureBootcamp: View {

    @State var offset: CGSize = .zero

    var body: some View {
        
        // Ex: 1 - A square that has DragGesture attached to it ----------------
//        RoundedRectangle(cornerRadius: 20)
//            .frame(width: 100, height: 100)
//            .offset(offset)
//            .gesture(
//                DragGesture()
//                    .onChanged { value in
//                        withAnimation(.spring()) {
//                            offset = value.translation
//                        }
//                    }
//                    .onEnded { value in
//                        withAnimation(.spring()) {
//                            offset = .zero
//                        }
//                    }
//            )
        
    // Ex: 2 - A card that can be swiped ---------------------------------------
        ZStack {
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                offset = value.translation
                            }
                        }
                        .onEnded { value in
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                        }
                )
        }

    }
    func getScaleAmount() -> CGFloat {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - percentage
    }

}

#Preview {
    DragGestureBootcamp()
}
