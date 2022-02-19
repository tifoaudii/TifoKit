//
//  ViewModifier.swift
//  
//
//  Created by Tifo Audi Alif Putra on 19/02/22.
//

import UIKit

public protocol ViewModifier {
    associatedtype View: UIView
    
    func height(_ height: CGFloat) -> View
    func width(_ width: CGFloat) -> View
    func backgroundColor(_ backgroundColor: UIColor) -> View
    func cornerRadius(_ cornerRadius: CGFloat) -> View
}
