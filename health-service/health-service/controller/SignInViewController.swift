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
        if (pwdTextField.text != pwdCheckTextField.text) {
            showAlter()
            return
        }
        
        let userInfo = UserInfoDto.init(userId: idTextField.text!, pwd: pwdTextField.text!, email: emailTextField.text!)
        let result = userService.signIn(userInfo: userInfo)
        
        if (result == true) {
            guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainView") as? ViewController else { return }
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainVC, animated: false)
        }
    }
    
    private func showAlter() {
        let alert = UIAlertController(title: "실패", message: "비밀번호가 일치하지 않습니다!", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
