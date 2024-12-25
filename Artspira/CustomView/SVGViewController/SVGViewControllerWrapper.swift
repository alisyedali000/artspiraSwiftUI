//
//  SVGViewControllerWrapper.swift
//  Artspira
//
//  Created by Syed Ahmad  on 23/12/2024.
//

import SwiftUI
struct SVGViewControllerWrapper: UIViewControllerRepresentable {
    var imageName: String
    @Binding var nodeColor: SwiftUI.Color // Correct reference to SwiftUI.Color
    @Binding var bgColor : SwiftUI.Color

    func makeUIViewController(context: Context) -> SVGViewController {
        let viewController = SVGViewController()
//        viewController.updateSVG(fileName: imageName) // Set initial
//        viewController.updateFillColor(color: UIColor(nodeColor))
        viewController.updateSVG(fileName: imageName)
        return viewController
    }

    func updateUIViewController(_ uiViewController: SVGViewController, context: Context) {
        
        uiViewController.updateFillColor(color: UIColor(nodeColor))
        uiViewController.updateBGColor(color: UIColor(bgColor))
    }
}

struct SVGParser: UIViewControllerRepresentable {
    var imageName: String

    func makeUIViewController(context: Context) -> SVGParserViewController {
        let viewController = SVGParserViewController()
        viewController.updateSVG(fileName: imageName) // Set initial
        return viewController
    }

    func updateUIViewController(_ uiViewController: SVGParserViewController, context: Context) {
        uiViewController.updateSVG(fileName: imageName)
    }
}