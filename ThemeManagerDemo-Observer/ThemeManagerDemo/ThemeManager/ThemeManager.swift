import Foundation

class ThemeManager {
    // MARK: - Current theme
    var theme: MyTheme {
        didSet {
            guard theme != oldValue else { return }
            apply()
        }
    }

    // MARK: - Lifecycle
    private init(defaultTheme: MyTheme) {
        self.theme = defaultTheme
    }

    private static var instance: ThemeManager?

    static var shared: ThemeManager {
        if instance == nil {
            instance = ThemeManager(defaultTheme: .light)
        }
        return instance!
    }

    // MARK: - Theme change notifying
    private var themables = NSHashTable<Themable>.weakObjects()

    func subscribe(_ themable: Themable) {
        themables.add(themable)
        themable.applyTheme(theme)
    }

    private func apply() {
        themables.allObjects.forEach {
            $0.applyTheme(theme)
        }
    }
}
