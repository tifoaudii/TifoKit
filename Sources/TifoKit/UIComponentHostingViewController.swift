//
//  UIComponentHostingViewController.swift
//  
//
//  Created by Tifo Audi Alif Putra on 19/02/22.
//

import UIKit

public protocol HostingView {
    @ComponentBuilder var view: ContentView { get }
}

public final class UIComponentHostingViewController: UIViewController {
    
    private let hostingView: HostingView
    
    public init(hostingView: HostingView) {
        self.hostingView = hostingView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        if let contentView = hostingView.view.asView().first {
            view.addSubview(contentView)
            contentView.fillParent()
        }
    }
}
