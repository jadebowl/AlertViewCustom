import UIKit

/**
  Choose the alert position
   - parameters:
      - center: default position
      - bottom: when set to true the alert appears with an animation from the bottom
*/
public enum AlertPosition {
    case center
    case bottom(animated: Bool)
}
