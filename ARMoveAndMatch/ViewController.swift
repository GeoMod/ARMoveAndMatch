//
//  ViewController.swift
//  ARMoveAndMatch
//
//  Created by Daniel O'Leary on 8/4/21.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = try! Experience.loadLetters()

		// Hard coded letters logic for demo purposes.

		// Allow for gesture control in the scene.
		guard let A = scene.uppercaseA else { return }
		if let uppercaseA = A as? Entity & HasCollision {
			uppercaseA.generateCollisionShapes(recursive: true)
//			arView.installGestures([.rotation, .translation], for: uppercaseA)
		}


		guard let B = scene.uppercaseB else { return }
		if let uppercaseB = B as? Entity & HasCollision {
			uppercaseB.generateCollisionShapes(recursive: true)
//			arView.installGestures([.rotation, .translation], for: uppercaseB)
		}


		guard let C = scene.uppercaseC else { return }
		if let uppercaseC = C as? Entity & HasCollision {
			uppercaseC.generateCollisionShapes(recursive: true)
//			arView.installGestures([.rotation, .translation], for: uppercaseC)
		}


		guard let D = scene.uppercaseD else { return }

		if let uppercaseD = D as? Entity & HasCollision {
			uppercaseD.generateCollisionShapes(recursive: true)
//			arView.installGestures([.rotation, .translation], for: uppercaseD)
		}
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(scene)
    }


}
