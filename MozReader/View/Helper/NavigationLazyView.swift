//
//  NavigationLazyView.swift
//  MozReader
//
//  Created by Khanh Trinh on 19/08/2021.
//

import Foundation
import SwiftUI

struct NavigationLazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}
