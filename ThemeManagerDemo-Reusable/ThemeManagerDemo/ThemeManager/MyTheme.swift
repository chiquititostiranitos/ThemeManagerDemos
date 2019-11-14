import UIKit
import Themer

/// Defines a theme enum, that describes available themes.
enum MyTheme: Themeful {
    case light
    case dark
    var settings: MyThemeModel {
        switch self {
        case .light: return MyThemeModel.lightThemeModel
        case .dark: return MyThemeModel.darkThemeModel
        }
    }
}
