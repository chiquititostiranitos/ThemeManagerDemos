import Foundation

struct TargetActionWrapper<T: AnyObject> : TargetAction {
    weak var target: T?
    let action: (T) -> (MyTheme) -> ()

    var isAvailable: Bool {
        return target != nil
    }

    func performAction(_ theme: MyTheme) -> () {
        if let t = target {
            action(t)(theme)
        }
    }
}
