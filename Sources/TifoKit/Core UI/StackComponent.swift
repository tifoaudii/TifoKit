//
//  MultiComponent.swift
//  SwiftyKit
//
//  Created by ruangguru on 03/06/21.
//

import UIKit

open class StackComponent<Component>: UIStackView where Component: LayoutComponent  {
    
    public init(@LayoutStackBuilder components: () -> Component) {
        super.init(frame: .zero)
        components().create().forEach { addArrangedSubview($0) }
    }
    
    required public init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension StackComponent {
    @discardableResult
    public func setMargins(_ value: CGFloat) -> StackComponent {
        layoutMargins = UIEdgeInsets.init(top: value, left: value, bottom: value, right: value)
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    public func setHorizontalMargins(_ value: CGFloat) -> StackComponent {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.left = value
        layoutMargins.right = value
        return self
    }
    
    @discardableResult
    public func setVerticalMargins(_ value: CGFloat) -> StackComponent {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.top = value
        layoutMargins.bottom = value
        return self
    }
    
    @discardableResult
    public func topMargins(_ value: CGFloat) -> StackComponent {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.top = value
        return self
    }
    
    @discardableResult
    public func leftMargins(_ value: CGFloat) -> StackComponent {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.left = value
        return self
    }
    
    @discardableResult
    public func rightMargins(_ value: CGFloat) -> StackComponent {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.right = value
        return self
    }
    
    @discardableResult
    public func bottomMargins(_ value: CGFloat) -> StackComponent {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins.bottom = value
        return self
    }
    
    @discardableResult
    public func setDistribution(_ distribution: UIStackView.Distribution) -> StackComponent {
        self.distribution = distribution
        return self
    }
    
    @discardableResult
    public func setSpacing(_ spacing: CGFloat) -> StackComponent {
        self.spacing = spacing
        return self
    }
    
    @discardableResult
    public func setAlignment(_ alignment: UIStackView.Alignment) -> StackComponent {
        self.alignment = alignment
        return self
    }
    
    @discardableResult
    public func setAxis(_ axis: NSLayoutConstraint.Axis) -> StackComponent {
        self.axis = axis
        return self
    }
}
