//
//  SignInViewController.swift
//  health-service
//
//  Created by NHN on 2021/06/16.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var pwdCheckTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    private var userService: UserService = UserService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signIn(_ sender: Any) {
        if (checkBeforeSignIn() == false) {
            return
        }
        
        let userInfo = UserInfoDto.init(userId: idTextField.text!, pwd: pwdTextField.text!, email: emailTextField.text!)
        let result = userService.signIn(userInfo: userInfo)
        
        if (result == true) {
            guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainView") as? ViewController else { return }
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainVC, animated: false)
        }
    }
    
    private func checkBeforeSignIn() -> Bool {
        if (idTextField.text?.isEmpty == true) {
            showAlter(title: "실패", message: "아이디를 입력해주세요!")
            self.idTextField.becomeFirstResponder()
            return false
        }
        
        if (pwdTextField.text?.isEmpty == true) {
            showAlter(title: "실패", message: "비밀번호를 입력해주세요!")
            self.pwdTextField.becomeFirstResponder()
            return false
        }
        
        if (pwdCheckTextField.text?.isEmpty == true) {
            showAlter(title: "실패", message: "비밀번호 확인을 입력해주세요!")
            self.pwdCheckTextField.becomeFirstResponder()
            return false
        }
        
        if (emailTextField.text?.isEmpty == true) {
            showAlter(title: "실패", message: "이메일을 입력해주세요!")
            self.emailTextField.becomeFirstResponder()
            return false
        }
        
        if (pwdTextField.text != pwdCheckTextField.text) {
            showAlter(title: "실패", message: "비밀번호가 일치하지 않습니다!")
            self.pwdTextField.becomeFirstResponder()
            return false
        }
        
        return true
    }
    
    private func showAlter(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    

}
