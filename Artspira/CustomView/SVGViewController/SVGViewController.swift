//
//  SCGViewController.swift
//  Artspira
//
//  Created by Syed Ahmad  on 23/12/2024.
//
import UIKit
import Macaw

class SVGViewController: UIViewController {
    
    var svgView = SVGView()
    var nodeTransform = Transform.identity
    var fillColor: UIColor = .red
    var totalScale: CGFloat = 2.0
    var totalTranslation: CGPoint = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize and configure svgView
        view.addSubview(svgView)
//        svgView = SVGView()
//        svgView.fileName = "example"
        svgView.isUserInteractionEnabled = true
        svgView.translatesAutoresizingMaskIntoConstraints = false
        svgView.backgroundColor = .clear
        // Add svgView to the view hierarchy
        view.addSubview(svgView)
        
        // Set up constraints for svgView
        NSLayoutConstraint.activate([
            svgView.topAnchor.constraint(equalTo: view.topAnchor),
            svgView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            svgView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            svgView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
        DispatchQueue.main.async {
            self.addTouchHandlersToNodes(node: self.svgView.node)
        }
        
        // Add pinch gesture recognizer
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(_:)))
        svgView.addGestureRecognizer(pinchGesture)
        
        // Add pan gesture recognizer
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        panGesture.delegate = self
        svgView.addGestureRecognizer(panGesture)
    }
    
    func changeNodeColor(nodeTag: String) {
        if let node = svgView.node.nodeBy(tag: nodeTag) {
            node.onTouchPressed { [weak self] touch in
                // Change the node's fill color when it's touched
                if let shapeNode = node as? Shape {
                    shapeNode.fill = Color.blue // Set to your desired color
                }
            }
        } else {
            print("Node with tag \(nodeTag) not found.")
        }
    }
//
//    func addTouchHandlersToNodes(node: Node) {
//        node.onTouchPressed { [weak self] touch in
//            guard let self = self else { return }
//            print("Node tapped: \(node)")
//            print("Node tag: \(node.tag ?? ["No tag"])")
//            print("Node type: \(type(of: node))")
//            self.changeNodeColor(nodeTag: node.tag.first ?? "")
//        }
//
//        if let group = node as? Group {
//            for child in group.contents {
//                addTouchHandlersToNodes(node: child)
//            }
//        }
//    }
    
    func addTouchHandlersToNodes(node: Node) {
        // Attach touch handlers to all nodes
        if let shapeNode = node as? Shape {
            shapeNode.onTouchPressed { [weak self] touch in
                guard let self = self else { return }
                print("Node tapped: \(shapeNode)")
                print("Node tag: \(shapeNode.tag ?? ["No tag"])")
                self.changeNodeColor(tappedNode: shapeNode)
            }
        }
        
        // Recursively attach handlers to children if the node is a Group
        if let group = node as? Group {
            for child in group.contents {
                addTouchHandlersToNodes(node: child)
            }
        }
    }

    func changeNodeColor(tappedNode: Shape) {
        let color = convertUIColorToMacawColor(uiColor: self.fillColor)
        tappedNode.fill = color // Update to your desired color
        
    }
    
    func convertUIColorToMacawColor(uiColor: UIColor) -> Color {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        // Extract RGBA components from UIColor
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        // Convert the CGFloat values to Int for red, green, blue
        // Alpha is passed as a Double, so no scaling is required.
        return Color.rgba(r: Int(red * 255), g: Int(green * 255), b: Int(blue * 255), a: Double(alpha))
    }
    
    @objc func handlePinchGesture(_ recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .began || recognizer.state == .changed {
            let scale = recognizer.scale

            totalScale *= scale
            recognizer.scale = 1.0
            updateNodeTransform()
            debugPrint("Pinched using macaw")
        }
    }
    
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: svgView)
        
        if recognizer.state == .began || recognizer.state == .changed {
            totalTranslation.x += translation.x
            totalTranslation.y += translation.y
            recognizer.setTranslation(.zero, in: svgView)
            updateNodeTransform()
            debugPrint("dragged using macaw")
        }
    }
    
    func updateNodeTransform() {
        let scaleTransform = Transform.scale(sx: totalScale, sy: totalScale)
        let translationTransform = Transform.move(dx: totalTranslation.x, dy: totalTranslation.y)
        nodeTransform = scaleTransform.concat(with: translationTransform)
        svgView.node.place = nodeTransform
    }
    
    
    func updateSVG(fileName: String) {
        svgView.fileName = fileName
    }

    func updateFillColor(color: UIColor) {
        // Update the color of nodes in the SVG
        self.fillColor = color
    }
    
    func updateBGColor(color: UIColor) {
        // Update the color of nodes in the SVG
        self.svgView.backgroundColor = color
    }
}

extension SVGViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

class SVGParserViewController: UIViewController {
    
    var svgView = SVGView()
    var nodeTransform = Transform.identity
    var totalScale: CGFloat = 1.0
    var totalTranslation: CGPoint = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(svgView)
        svgView.isUserInteractionEnabled = true
        svgView.translatesAutoresizingMaskIntoConstraints = false
        svgView.backgroundColor = .clear
        // Add svgView to the view hierarchy
        view.addSubview(svgView)
        
        // Set up constraints for svgView
        NSLayoutConstraint.activate([
            svgView.topAnchor.constraint(equalTo: view.topAnchor),
            svgView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            svgView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            svgView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }

    func updateSVG(fileName: String) {
        svgView.fileName = fileName
    }

}

