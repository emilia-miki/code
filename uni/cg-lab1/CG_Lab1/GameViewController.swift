//
//  GameViewController.swift
//  CG_Lab1
//
//  Created by Mykyta Diachyna on 01.12.2022.
//

import Cocoa
import MetalKit

// Our macOS specific view controller
class GameViewController: NSViewController {

    var renderer: Renderer!
    var mtkView: MTKView!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let mtkView = self.view as? MTKView else {
            print("View attached to GameViewController is not an MTKView")
            return
        }
        
        // Select the device to render with.  We choose the default device
        guard let defaultDevice = MTLCreateSystemDefaultDevice() else {
            print("Metal is not supported on this device")
            return
        }

        mtkView.device = defaultDevice

        guard let newRenderer = Renderer(metalKitView: mtkView) else {
            print("Renderer cannot be initialized")
            return
        }

        renderer = newRenderer

        renderer.mtkView(mtkView, drawableSizeWillChange: mtkView.drawableSize)

        mtkView.delegate = renderer
        
        NSEvent.addLocalMonitorForEvents(matching: .keyDown, handler: keyDown)
    }
    
    func keyDown(with event: NSEvent) -> NSEvent? {
        switch (event.characters?.lowercased()) {
        case "s", "d":
            renderer.x += 0.05
            renderer.y += -0.05
            break
        case "a", "w":
            renderer.x -= 0.05
            renderer.y -= -0.05
            break
        default:
            break
        }
        
        return nil
    }
    
}
