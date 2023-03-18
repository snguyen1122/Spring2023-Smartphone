//
//  ViewController.swift
//  LoginExampleFirebase
//
//  Created by Son Nguyen on 3/4/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var lblStatus: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblStatus.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let keyChain = KeychainService()._keychain
        if keyChain.get("uid") != nil {
            performSegue(withIdentifier: "segueDashboard", sender: self)
        }
    }
    
    func addKeyChainAfterLogin(uid : String)
    {
        let keyChain = KeychainService()._keychain
        keyChain.set(uid, "uid")
    }

    @IBAction func loginAction(_ sender: Any) {
        guard let email = txtEmail.text else {return}
        guard let password = txtPassword.text else {return}
    
        if email.isEmail == false {
            lblStatus.text = "Please enter a valid email"
            lblStatus.isHidden = false
            return
        }
        
        /*
        if password.isValidPassword == false {
            lblStatus.text = "Please enter a valid password"
            lblStatus.isHidden = false
            return
        }
        */
        
        Auth.auth().signIn(withEmail: email, password: password) {[weak self] authResult, error in
            guard let strongSelf = self else {return}
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                strongSelf.lblStatus.isHidden = false
                return
            }
            strongSelf.lblStatus.text = "Logged in"
            strongSelf.lblStatus.isHidden = true
            guard let uid = Auth.auth().currentUser?.uid else {return}
            strongSelf.performSegue(withIdentifier: "segueDashboard", sender: strongSelf)
        }
    }
}

