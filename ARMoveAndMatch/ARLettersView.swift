//
//  ViewController.swift
//  ARMoveAndMatch
//
//  Created by Daniel O'Leary on 8/4/21.
//

import ARKit
import RealityKit
import UIKit

class ARLettersView: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

		setupCoachingOverlay()

//		let scene = try! Experience.loadLetters()



		// Hard coded letters logic for demo purposes.
		// Allow for gesture control in the scene.
//		guard let A = scene.uppercaseA else { return }
//		if let uppercaseA = A as? Entity & HasCollision {
//			uppercaseA.generateCollisionShapes(recursive: true)
//			arView.installGestures([.rotation, .translation], for: uppercaseA)
//		}
//
//		guard let B = scene.uppercaseB else { return }
//		if let uppercaseB = B as? Entity & HasCollision {
//			uppercaseB.generateCollisionShapes(recursive: true)
//			arView.installGestures([.rotation, .translation], for: uppercaseB)
//		}
//
//		guard let C = scene.uppercaseC else { return }
//		if let uppercaseC = C as? Entity & HasCollision {
//			uppercaseC.generateCollisionShapes(recursive: true)
//			arView.installGestures([.rotation, .translation], for: uppercaseC)
//		}
//
//		guard let D = scene.uppercaseD else { return }
//		if let uppercaseD = D as? Entity & HasCollision {
//			uppercaseD.generateCollisionShapes(recursive: true)
//			arView.installGestures([.rotation, .translation], for: uppercaseD)
//		}
//        arView.scene.anchors.append(scene)
    }

}


extension ARLettersView: ARCoachingOverlayViewDelegate {
	func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
		arView.isHidden = true
	}

	func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
		arView.isHidden = false
	}

	func setupCoachingOverlay() {
		// Called in viewDidLoad
		let coachingOverlay = ARCoachingOverlayView(frame: arView.frame)
		coachingOverlay.translatesAutoresizingMaskIntoConstraints = false
		arView.addSubview(coachingOverlay)
		// Set Auto Layout constraints
		coachingOverlay.topAnchor.constraint(equalTo: arView.topAnchor).isActive = true
		coachingOverlay.leadingAnchor.constraint(equalTo: arView.leadingAnchor).isActive = true
		coachingOverlay.trailingAnchor.constraint(equalTo: arView.trailingAnchor).isActive = true
		coachingOverlay.bottomAnchor.constraint(equalTo: arView.bottomAnchor).isActive = true
		// Specify a goal for the coaching overlay, in this case, the goal is to establish world tracking
		coachingOverlay.goal = .horizontalPlane
		// Tell the coaching overlay which ARSession it should be monitoring
		coachingOverlay.session = arView.session
	}
}
