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
    
    public static func buildBlock(_ views: ContentView...) -> CollectionContentView {
        CollectionContentView(contents: views.compactMap { $0 })
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

public struct CollectionContentView: ContentView {
    
    private let contents: [ContentView?]
    
    init(contents: [ContentView]) {
        self.contents = contents
    }
    
    public func asView() -> [UIView] {
        contents.compactMap { $0 }.flatMap { $0.asView() }
    }
}
