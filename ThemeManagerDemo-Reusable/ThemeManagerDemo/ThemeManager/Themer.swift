import UIKit
import Themer

// Establish the theme manager. Integration point.
extension Themer where T == MyTheme {
    private static var instance: Themer<MyTheme>?
    static var shared: Themer<MyTheme> {
        if instance == nil {
            instance = Themer<MyTheme>(defaultTheme: .light)
        }
        return instance!
    }
}
