import UIKit
import Foundation
import CoreGraphics

class PhysicsEngine: ObservableObject {
    @Published var objects: [PhysicalObject] = []
    var timer: Timer?
    
    init() {
        objects.append(PhysicalObject(position: CGPoint(x: 100, y: 100), velocity: CGPoint(x: 1, y: 1), radius: 20))
        objects.append(PhysicalObject(position: CGPoint(x: 200, y: 200), velocity: CGPoint(x: -1, y: -1), radius: 30))
    }
    
    func startSimulation() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true) { _ in
            self.updatePhysics()
        }
    }
    
    func stopSimulation() {
        timer?.invalidate()
    }
    
    private func updatePhysics() {
        for i in 0..<objects.count {
            objects[i].position.x += objects[i].velocity.x
            objects[i].position.y += objects[i].velocity.y
            
            if objects[i].position.x - objects[i].radius < 0 || objects[i].position.x + objects[i].radius > UIScreen.main.bounds.width {
                objects[i].velocity.x = -objects[i].velocity.x
            }
            if objects[i].position.y - objects[i].radius < 0 || objects[i].position.y + objects[i].radius > UIScreen.main.bounds.height {
                objects[i].velocity.y = -objects[i].velocity.y
            }
        }
    }
}
