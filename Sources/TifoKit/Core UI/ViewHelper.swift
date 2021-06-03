//
//  ViewHelper.swift
//  SwiftyKit
//
//  Created by ruangguru on 03/06/21.
//

import UIKit

public protocol LayoutStackBehaviour {
    func HStack<Component: LayoutComponent>(@LayoutStackBuilder components: () -> Component) -> StackComponent<Component>
    func VStack<Component: LayoutComponent>(@LayoutStackBuilder components: () -> Component) -> StackComponent<Component>
}

extension LayoutStackBehaviour where Self: UIViewController {
    @discardableResult
    func HStack<Component: LayoutComponent>(@LayoutStackBuilder components: () -> Component) -> StackComponent<Component> {
        let stack = StackComponent(components: components).setAxis(.horizontal)
        view.addSubview(stack)
        stack.fillSuperview()
        return stack
    }
    
    @discardableResult
    func VStack<Component: LayoutComponent>(@LayoutStackBuilder components: () -> Component) -> StackComponent<Component> {
        let stack = StackComponent(components: components).setAxis(.vertical)
        view.addSubview(stack)
        stack.fillSuperview()
        return stack
    }
}

extension LayoutStackBehaviour where Self: UIView {
    
    @discardableResult
    func HStack<Component: LayoutComponent>(@LayoutStackBuilder components: () -> Component) -> StackComponent<Component> {
        let stack = StackComponent(components: components).setAxis(.horizontal)
        addSubview(stack)
        stack.fillSuperview()
        return stack
    }
    
    @discardableResult
    func VStack<Component: LayoutComponent>(@LayoutStackBuilder components: () -> Component) -> StackComponent<Component> {
        let stack = StackComponent(components: components).setAxis(.vertical)
        addSubview(stack)
        stack.fillSuperview()
        return stack
    }
}

public protocol LayoutBehaviour {
    func fillSuperview(offset: CGFloat)
    func setWidth(_ width: CGFloat) -> UIView
    func setHeight(_ height: CGFloat) -> UIView
    func setCornerRadius(_ cornerRadius: CGFloat) -> UIView
    func setBackgroundColor(_ backgroundColor: UIColor) -> UIView
}

extension UIView: LayoutBehaviour {
    
    public func fillSuperview(offset: CGFloat = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        guard let superview = superview else {
            return
        }
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: offset),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: offset),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -offset),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: offset)
        ])
    }
    
    @discardableResult
    public func setWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    public func setHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    public func setCornerRadius(_ cornerRadius: CGFloat) -> UIView {
        self.layer.cornerRadius = cornerRadius
        return self
    }
    
    @discardableResult
    public func setBackgroundColor(_ color: UIColor) -> UIView {
        self.backgroundColor = color
        return self
    }
}

