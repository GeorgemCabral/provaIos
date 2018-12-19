//
//  ViewController.swift
//  ProvaIos
//
//  Created by george on 12/12/18.
//  Copyright © 2018 br.com.unifor. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var senhaTextField: UITextField!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.emailTextField.text!, password: self.senhaTextField.text!) { (authResult, error) in
            
            guard let user = authResult?.user else { return }
            
            print("Usuario \(user.email!) logado!")
            
        }
    }
    
    @IBAction func registrarButtonClicked(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.senhaTextField.text!) { (authResult, error) in
            
            guard let user = authResult?.user else { return }
            
            print("Usuario \(user.email!) criado!")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let _ = user {
                print("Usuário já está logado!")
                self.performSegue(withIdentifier: "LOGADO", sender: nil)
                
            }
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
