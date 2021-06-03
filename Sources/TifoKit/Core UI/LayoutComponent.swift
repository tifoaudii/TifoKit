//
//  LayoutComponent.swift
//  SwiftyKit
//
//  Created by ruangguru on 03/06/21.
//

import UIKit

public protocol LayoutComponent {
    func create() -> [UIView]
}

public struct MultiComponents: LayoutComponent {
    
    public let components: [LayoutComponent?]
    
    init(_ components: [LayoutComponent]) {
        self.components = components
    }
    
    public func create() -> [UIView] {
        components.compactMap { $0 }.flatMap { $0.create() }
    }
}

@resultBuilder public struct LayoutStackBuilder {
    public static func buildBlock(_ components: LayoutComponent...) -> MultiComponents {
        MultiComponents(components.compactMap { $0 })
    }
    
}

extension UIView: LayoutComponent {
    public func create() -> [UIView] {
        [self]
    }
}
