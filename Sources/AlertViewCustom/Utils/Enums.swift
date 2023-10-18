import UIKit

/// Choose the alert position
public enum AlertPosition {
    /// Default position
    case center
    /// When set to true the alert appears with an animation from the bottom
    case bottom(animated: Bool)
}
