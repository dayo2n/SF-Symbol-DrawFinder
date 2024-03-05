//
//  SFSymbolListView.swift
//  SF-Symbol-Finder
//
//  Created by 제나 on 3/4/24.
//

import SwiftUI

struct SFSymbolListView: View {
    let keyword: String
    private var systemNames: [String] {
        let keyword = keyword.replacingOccurrences(of: "_", with: ".")
        return Constants.sfsymbols.filter({ $0.contains(keyword)})
    }
    @State private var showClipboardAlert = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            Color.neutral
            ScrollView {
                VStack {
                    Text("Click to copy the name to the clipboard")
                        .font(.headline)
                        .foregroundStyle(Color.accentColor)
                    LazyVGrid(columns: [GridItem()]) {
                        ForEach(systemNames, id: \.self) { systemName in
                            ZStack {
                                Rectangle()
                                    .stroke(Color.accentColor, lineWidth: 0.5)
                                    .background(Color.neutral)
                                HStack(spacing: 10) {
                                    Image(systemName: systemName)
                                        .font(.largeTitle)
                                        .padding()
                                        .foregroundStyle(.white)
                                        .frame(width: 80)
                                    Text(systemName)
                                        .font(.subheadline)
                                        .foregroundStyle(.white)
                                    Spacer()
                                }
                            }
                            .onTapGesture {
                                UIPasteboard.general.string = systemName
                                showClipboardAlert = true
                            }
                        }
                    }
                }
                .padding()
                .padding(.top, 40)
            }
            VStack {
                ZStack {
                    HStack {
                        Spacer()
                        Text(keyword)
                            .foregroundStyle(Color.accentColor)
                            .font(.body)
                        Spacer()
                    }
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "chevron.backward")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.accentColor)
                        }
                        .padding()
                        Spacer()
                    }
                }
                .background(Color.black.opacity(0.3))
                Spacer()
                Spacer()
            }
            
            if showClipboardAlert {
                Color
                    .black
                    .opacity(0.7)
                    .ignoresSafeArea()
                HStack(spacing: 10) {
                    Image(systemName: "doc.on.clipboard")
                        .font(.title3)
                        .foregroundStyle(.white)
                    Text("Copied to clipboard")
                        .font(.title3)
                        .foregroundStyle(.white)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.gray.opacity(0.5))
                )
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        showClipboardAlert = false
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}
