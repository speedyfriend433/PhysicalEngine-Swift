import Foundation
import SwiftUI
import CoreGraphics

struct PhysicalObject: Identifiable {
    let id = UUID()
    var position: CGPoint
    var velocity: CGPoint
    var radius: CGFloat
}
