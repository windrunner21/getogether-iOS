//
//  ViewController.swift
//  getogether
//
//  Created by Imran Hajiyev on 12.04.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindAction(unwindSegue: UIStoryboardSegue) {
    }

}

extension UIViewController: UITextFieldDelegate {
    
    func moveWithKeyboard(on notification: NSNotification, move constraint: NSLayoutConstraint, if keyboardWillShow: Bool, by defaultValue: CGFloat) {
        guard let userInfo = notification.userInfo else { return }
        
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        guard let keyboardAnimationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
        guard let keyboardAnimationCurve = UIView.AnimationCurve(rawValue: userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as! Int) else { return }
        
        let keyboardHeight = keyboardSize.cgRectValue.height
        
        if keyboardWillShow {
            let safeAreaExists = self.view?.window?.safeAreaInsets.bottom != 0
            constraint.constant = keyboardHeight + (safeAreaExists ? 0 : defaultValue)
        } else {
            constraint.constant = defaultValue
        }
        
        let animator = UIViewPropertyAnimator(duration: keyboardAnimationDuration, curve: keyboardAnimationCurve) { [weak self] in
            // update constraints
            self?.view.layoutIfNeeded()
        }
        
        animator.startAnimation()
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = ColorEnum.primary.cgColor
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = ColorEnum.def.cgColor
    }
}

