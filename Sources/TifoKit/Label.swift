//
//  Label.swift
//  
//
//  Created by Tifo Audi Alif Putra on 19/02/22.
//

import UIKit

public final class Label: UILabel {
    
    public init() {
        super.init(frame: .zero)
        backgroundColor = .white
    }
    
    public init(_ text: String) {
        super.init(frame: .zero)
        self.text = text
        backgroundColor = .white
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @discardableResult
    public func text(_ text: String) -> Label {
        self.text = text
        return self
    }
    
    @discardableResult
    public func font(_ font: UIFont) -> Label {
        self.font = font
        return self
    }
    
    @discardableResult
    public func textColor(_ textColor: UIColor) -> Label {
        self.textColor = textColor
        return self
    }
}

extension Label: ContentView {
    public func asView() -> [UIView] {
        [self]
    }
}
