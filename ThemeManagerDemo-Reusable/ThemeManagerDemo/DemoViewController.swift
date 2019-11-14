import UIKit
import Themer

/// A custom view contoller. Subclasses ThemableViewController.
class DemoViewController: ThemableViewController {
    @IBOutlet weak var descriptionLabel: ThemableLabel!

    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!

    @IBAction func modeSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: isDarkMode = false
        case 1: isDarkMode = true
        default: break
        }
    }

    var isDarkMode: Bool = false {
        didSet {
            Themer.shared.theme = isDarkMode
                ? .dark
                : .light
            modeSegmentedControl.selectedSegmentIndex = isDarkMode
                ? 1
                : 0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Subscribe to theme notifications.
        Themer.shared.add(target: self, action: DemoViewController.applyTheme)

        updateMode()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        guard UIApplication.shared.applicationState == .inactive else {
            return
        }

        updateMode()
    }

    func updateMode() {
        if #available(iOS 13.0, *) {
            isDarkMode = traitCollection.userInterfaceStyle == .dark
        }
    }
}

extension DemoViewController {
    /// Handles theme notifications. Receives a new theme.
    private func applyTheme(_ theme: MyTheme) {
        switch theme {
        case .light:
            descriptionLabel.text = "Light Mode"
        case .dark:
            descriptionLabel.text = "Dark Mode"
        }
        descriptionLabel.textColor = theme.settings.textColor
        descriptionLabel.sizeToFit()
        // The below code is commented out, because it's in ThemableViewController now.
//        view.backgroundColor = theme.settings.appBgColor
    }
}

