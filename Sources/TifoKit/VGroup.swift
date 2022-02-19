//
//  VGroup.swift
//  
//
//  Created by Tifo Audi Alif Putra on 19/02/22.
//

import UIKit

public final class VGroup: UIStackView {
    
    public init(@ComponentBuilder views: () -> ContentView) {
        super.init(frame: .zero)
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
        views().asView().forEach { addArrangedSubview($0) }
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension VGroup: StackModifier {
    
    @discardableResult
    public func setAlignment(_ alignment: UIStackView.Alignment) -> VGroup {
        self.alignment = alignment
        return self
    }
    
    @discardableResult
    public func setSpacing(_ spacing: CGFloat) -> VGroup {
        self.spacing = spacing
        return self
    }
    
    @discardableResult
    public func setDistribution(_ distribution: UIStackView.Distribution) -> VGroup {
        self.distribution = distribution
        return self
    }
}

extension VGroup: ContentView {
    public func asView() -> [UIView] {
        [self]
    }
}

