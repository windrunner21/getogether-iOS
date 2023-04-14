//
//  CustomUITextField.swift
//  getogether
//
//  Created by Imran Hajiyev on 14.04.23.
//

import UIKit

class CustomUITextField: UITextField {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 4
        self.layer.borderWidth = 1
        self.layer.borderColor = ColorEnum.def.cgColor
    }
}
