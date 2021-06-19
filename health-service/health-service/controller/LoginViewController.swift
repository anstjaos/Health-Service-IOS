//
//  LoginViewController.swift
//  health-service
//
//  Created by NHN on 2021/06/15.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        guard let mainVC = self.storyboard?.instantiateViewController(withIdentifier: "MainView") as? ViewController else { return }
        self.navigationController?.pushViewController(mainVC, animated: true)
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainVC, animated: false)
    }
    
    @IBAction func signIn(_ sender: Any) {
        guard let signInVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInView") as? SignInViewController else { return }
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(signInVC, animated: false)
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
