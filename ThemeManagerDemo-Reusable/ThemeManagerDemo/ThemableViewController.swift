import UIKit
import Themer

/// A basic themable view controller to be subclassed by others.
class ThemableViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Subscribe to theme notifications.
        Themer.shared.add(target: self, action: ThemableViewController.applyTheme)
    }
}

extension ThemableViewController {
    /// Handles theme notifications. Receives a new theme.
    private func applyTheme(_ theme: MyTheme) {
        view.backgroundColor = theme.settings.appBgColor
    }
}
