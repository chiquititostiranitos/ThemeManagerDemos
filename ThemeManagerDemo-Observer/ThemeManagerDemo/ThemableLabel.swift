import UIKit

/// A basic themable label to be subclassed by others.
class ThemableLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        // Subscribe to theme notifications.
        ThemeManager.shared.subscribe(self)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        // Subscribe to theme notifications.
        ThemeManager.shared.subscribe(self)
    }
}

extension ThemableLabel : Themable {
    /// Handles theme notifications. Receives a new theme.
    func applyTheme(_ theme: MyTheme) {
        backgroundColor = theme.settings.highlightedBgColor
    }
}
