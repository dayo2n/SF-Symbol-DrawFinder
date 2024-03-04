//
//  Frame6View.swift
//  SFSymbolFinder
//
//  Created by 제나 on 2/5/24.
//

import SwiftUI
import CoreML
import Vision

struct ContentView: View {
    @State var isClear = false
    @State var canvasRepresentingView: CanvasRepresentingView?
    @Environment(\.undoManager) var undoManager
    @State var results = [Result]()
    @State var isNavigate = false
    @State var selectedLabel = ""
    @State var showErrorAlert = false
    @State var onAppeared = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing: 30) {
                    canvasView
                    resultView
                }
                .frame(height: 500)
                .padding(20)
                .background(Color.primary100)
            }
            .padding(50)
            .onAppear {
                if !onAppeared {
                    canvasRepresentingView = CanvasRepresentingView(isClear: $isClear)
                    onAppeared = true
                }
            }
            
            if showErrorAlert {
                Color.black
                    .opacity(0.8)
                VStack(spacing: 10) {
                    Image(systemName: "exclamationmark.warninglight.fill")
                        .font(.title)
                        .foregroundStyle(.white)
                    Text("An error occured.\nPlease run the app again.")
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                }
                .padding(30)
                .background (
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundStyle(.gray)
                )
            }
        }
    }
}
