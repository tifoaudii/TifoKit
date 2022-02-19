//
//  File.swift
//  
//
//  Created by Tifo Audi Alif Putra on 19/02/22.
//

import UIKit

public final class View: UIView {
    
    public init() {
        super.init(frame: .zero)
    }
    
    public init(@ComponentBuilder views: () -> ContentView) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        let contentView = VGroup(views: views)
        addSubview(contentView)
        contentView.fillParent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension View: ViewModifier {
    
    @discardableResult
    public func backgroundColor(_ backgroundColor: UIColor) -> View {
        self.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    public func height(_ height: CGFloat) -> View {
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    public func width(_ width: CGFloat) -> View {
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    public func cornerRadius(_ cornerRadius: CGFloat) -> View {
        self.layer.cornerRadius = cornerRadius
        return self
    }
}

extension View: ContentView {
    public func asView() -> [UIView] {
        [self]
    }
}

public extension UIView {
    func fillParent() {
        guard let superView = self.superview else {
            return
        }
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
}
