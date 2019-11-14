import UIKit

/// Defines a theme enum, that describes available themes.
enum MyTheme {
    case light
    case dark
    var settings: MyThemeModel {
        switch self {
        case .light: return MyThemeModel.lightThemeModel
        case .dark: return MyThemeModel.darkThemeModel
        }
    }
}
