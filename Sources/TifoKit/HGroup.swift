//
//  HGroup.swift
//  
//
//  Created by Tifo Audi Alif Putra on 19/02/22.
//

import UIKit

public final class HGroup: UIStackView {
    
    public init(@ComponentBuilder views: () -> ContentView) {
        super.init(frame: .zero)
        axis = .horizontal
        translatesAutoresizingMaskIntoConstraints = false
        views().asView().forEach { addArrangedSubview($0) }
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension HGroup: StackModifier {
    
    @discardableResult
    public func setAlignment(_ alignment: UIStackView.Alignment) -> HGroup {
        self.alignment = alignment
        return self
    }
    
    @discardableResult
    public func setSpacing(_ spacing: CGFloat) -> HGroup {
        self.spacing = spacing
        return self
    }
    
    @discardableResult
    public func setDistribution(_ distribution: UIStackView.Distribution) -> HGroup {
        self.distribution = distribution
        return self
    }
}

extension HGroup: ContentView {
    public func asView() -> [UIView] {
        [self]
    }
}
