//
//  Scene+Extension.swift
//  SF-Symbol-Finder
//
//  Created by 제나 on 3/4/24.
//

import SwiftUI

extension Scene {
    func windowResizabilityContentSize() -> some Scene {
        if #available(macOS 13.0, *), #available(iOS 17.0, *) {
            return windowResizability(.contentSize)
        } else {
            return self
        }
    }
}
