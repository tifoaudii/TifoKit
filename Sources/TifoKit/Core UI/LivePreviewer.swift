//
//  LivePreviewer.swift
//  SwiftyKit
//
//  Created by ruangguru on 03/06/21.
//

import Foundation

#if DEBUG
import SwiftUI

@available(iOS 13, *)
public extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }

    func preview() -> some View {
        Preview(viewController: self)
    }
}
#endif
