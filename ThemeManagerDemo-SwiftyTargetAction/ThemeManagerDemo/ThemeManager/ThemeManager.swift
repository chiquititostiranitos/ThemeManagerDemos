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
    private var targetActions: [TargetAction] = []

    public func add<T: AnyObject>(target: T, action: @escaping (T) -> (MyTheme) -> ()) {
        let ta = TargetActionWrapper(target: target, action: action)
        targetActions.append(ta)
        ta.performAction(theme)
    }

    private func apply() {
        // Clean up deallocated targets.
        targetActions.removeAll {
            !$0.isAvailable
        }
        targetActions.filter({$0.isAvailable}).forEach {
            // Call the target action to have theme reapplied.
            $0.performAction(theme)
        }
    }
}
