//
//  ComponentBuilder.swift
//  
//
//  Created by Tifo Audi Alif Putra on 19/02/22.
//

import UIKit

@resultBuilder public struct ComponentBuilder {
    public static func buildBlock(_ view: ContentView) -> ContentView {
        view
    }
    
    public static func buildBlock(_ views: ContentView...) -> [ContentView] {
        views.compactMap { $0 }
    }
    
    public static func buildIf(_ view: ContentView?) -> ContentView {
        view ?? []
    }
    
    public static func buildEither(first view: ContentView) -> ContentView {
        view
    }
    
    public static func buildEither(second view: ContentView) -> ContentView {
        view
    }
}

extension Array: ContentView where Element: UIView {
    public func asView() -> [UIView] { self }
}

