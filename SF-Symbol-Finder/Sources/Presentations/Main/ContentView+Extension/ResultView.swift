//
//  ResultView.swift
//  SF-Symbol-Finder
//
//  Created by 제나 on 3/4/24.
//

import SwiftUI

extension ContentView {
    var resultView: some View {
        NavigationView {
            ZStack {
                Color.neutral
                VStack {
                    Text("You can search with the keyword below\nPress the button to see if there's a symbol you're looking for")
                        .multilineTextAlignment(.center)
                        .font(.headline)
                        .foregroundStyle(Color.primary100)
                        .padding()
                    Spacer()
                    NavigationLink(
                        destination: SFSymbolListView(keyword: selectedLabel)
                            .navigationTitle(selectedLabel),
                        isActive: $isNavigate,
                        label: { EmptyView() }
                    )
                    ForEach(results, id: \.self) { result in
                        Button {
                            selectedLabel = result.label
                            isNavigate = true
                        } label : {
                            VStack(spacing: 2) {
                                let label = result.label.replacingOccurrences(of: "_", with: ".")
                                Text("\(label)")
                                    .font(.callout)
                                    .bold()
                                    .foregroundStyle(.white)
                                Text("confidence **\(result.confidence)**%")
                                    .font(.callout)
                                    .foregroundStyle(.white.opacity(0.8))
                            }
                            .frame(width: 350)
                        }
                        .padding(2)
                        .buttonStyle(BorderedButtonStyle())
                    }
                    Spacer()
                }
                .padding()
                .background(Color.neutral)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .frame(width: 450)
    }
}
