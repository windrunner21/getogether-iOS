//
//  ColorEnumExtension.swift
//  getogether
//
//  Created by Imran Hajiyev on 18.04.23.
//

import UIKit

extension ColorEnum {
    var color: UIColor {
        switch self {
        case .success:
            return UIColor(red: 108/255, green: 209/255, blue: 78/255, alpha: 1)
        case .warning:
            return UIColor(red: 247/255, green: 158/255, blue: 27/255, alpha: 1)
        case .error:
            return UIColor(red: 235/255, green: 0/255, blue: 27/255, alpha: 1)
        case .transparent:
            return UIColor(red: 255/255, green: 110/255, blue: 49/255, alpha: 0)
        case .primary:
            return UIColor(red: 255/255, green: 110/255, blue: 49/255, alpha: 1)
        case .secondary:
            return UIColor(red: 36/255, green: 55/255, blue: 99/255, alpha: 1)
        case .def:
            return UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
        }
    }
    
    var cgColor: CGColor {
        switch self {
        case .success:
            return UIColor(red: 108/255, green: 209/255, blue: 78/255, alpha: 1).cgColor
        case .warning:
            return UIColor(red: 247/255, green: 158/255, blue: 27/255, alpha: 1).cgColor
        case .error:
            return UIColor(red: 235/255, green: 0/255, blue: 27/255, alpha: 1).cgColor
        case .transparent:
            return UIColor(red: 255/255, green: 110/255, blue: 49/255, alpha: 0).cgColor
        case .primary:
            return UIColor(red: 255/255, green: 110/255, blue: 49/255, alpha: 1).cgColor
        case .secondary:
            return UIColor(red: 36/255, green: 55/255, blue: 99/255, alpha: 1).cgColor
        case .def:
            return UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1).cgColor
        }
    }
}
