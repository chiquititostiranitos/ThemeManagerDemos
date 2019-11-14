protocol TargetAction {
    var isAvailable: Bool { get }
    func performAction(_ theme: MyTheme)
}
