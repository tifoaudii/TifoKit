//
//  Button.swift
//  
//
//  Created by Tifo Audi Alif Putra on 19/02/22.
//

import UIKit

public final class Button: UIButton {
    
    private var tapHandler: (() -> Void)?
    
    public init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
    }
    
    public init(title: String, onTap: @escaping () -> Void) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
        tapHandler = onTap
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        configureTapHandler()
    }
    
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    @discardableResult
    public func onTap(_ onTap: @escaping () -> Void) -> Button {
        self.tapHandler = onTap
        return self
    }
    
    @discardableResult
    public func titleColor(_ title: String, state: UIControl.State) -> Button {
        self.setTitle(title, for: state)
        return self
    }
    
    @discardableResult
    public func titleColor(_ titleColor: UIColor, state: UIControl.State) -> Button {
        self.setTitleColor(titleColor, for: state)
        return self
    }
    
    private func configureTapHandler() {
        addTarget(self, action: #selector(buttonTapHandler), for: .touchUpInside)
    }
    
    @objc private func buttonTapHandler() {
        tapHandler?()
    }
}

extension Button: ViewModifier {
    
    @discardableResult
    public func cornerRadius(_ cornerRadius: CGFloat) -> Button {
        self.layer.cornerRadius = cornerRadius
        return self
    }
    
    @discardableResult
    public func height(_ height: CGFloat) -> Button {
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    public func width(_ width: CGFloat) -> Button {
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    public func backgroundColor(_ backgroundColor: UIColor) -> Button {
        self.backgroundColor = backgroundColor
        return self
    }
}

extension Button: ContentView {
    public func asView() -> [UIView] {
        [self]
    }
}
