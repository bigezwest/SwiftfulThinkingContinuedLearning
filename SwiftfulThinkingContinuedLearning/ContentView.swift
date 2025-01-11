//
//  ContentView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var isCompleteBtn1: Bool = false
    @State var isCompleteBtn2: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        Spacer()
        // Ex: 1 - Button - onLongPressGesture ---------------------------------
        Text("Example 1")
            .font(.headline)
        Text("This is a button that changes colors when pressed for 1 second.")
            .padding(.bottom)
        Text(isCompleteBtn1 ? "Completed" : "Not Completed")
            .padding()
            .padding(.horizontal)
            .background(isCompleteBtn1 ? Color.green : Color.gray)
            .cornerRadius(10)
            .onLongPressGesture (
                minimumDuration: 1.0,
                maximumDistance: 50
            ) {
                isCompleteBtn1.toggle()
            }
        Spacer()
        Divider()
            .frame(minHeight: 2)
            .overlay(Color.gray)
        // Ex: 2 - Retangle - 2 buttons - onLongPressGesture -------------------
        Text("Example 2")
            .font(.headline)
        Text("This bar changes colors when the Click Here button is pressed. When it reaches the end, the color will change to yellow.  The bar color will return to its original color when the bar is released prior to reaching the end. . ")
            .padding(.top)
        VStack {
            Rectangle()
                .fill(isSuccess ? Color.yellow : Color.blue)
                .frame(maxWidth: isCompleteBtn2 ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            HStack {
                Text("Click Here")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(
                        minimumDuration: 1.0,
                        maximumDistance: 50) { (isPressing) in
                            // Start of press to min duration
                            if isPressing {
                                withAnimation(.easeInOut(duration: 1.0)) {
                                    isCompleteBtn2 = true
                                }
                            } else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    if !isSuccess {
                                        withAnimation(.easeInOut) {
                                            isCompleteBtn2 = false
                                        }
                                    }
                                }
                            }
                        } perform: {
                            // At the min duration
                            withAnimation(.easeInOut) {
                                isSuccess = true
                            }
                        }

                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isCompleteBtn2 = false
                    }
            }
        }
        Spacer()
    }
}

#Preview {
    ContentView()
}
