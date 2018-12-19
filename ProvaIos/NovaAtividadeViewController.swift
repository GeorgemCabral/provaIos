//
//  NovaAtividadeViewController.swift
//  ProvaIos
//
//  Created by george on 13/12/18.
//  Copyright © 2018 br.com.unifor. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class NovaAtividadeViewController: UIViewController {
    
    var ref: DatabaseReference! = Database.database().reference()
    var atividade: Atividade?
    
    @IBOutlet weak var nomeTextView: UITextField!
    @IBOutlet weak var prioridadeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var concluidoSwitch: UISwitch!
    
//    @IBAction func criarButtonClicked(_ sender: Any) {
//        let nome:String = nomeTextView.text!
//        let prioridade:Int = prioridadeSegmentedControl.selectedSegmentIndex
//        let concluido:Bool = concluidoSwitch.isOn
//
//        let novaAtividade = Atividade(nome: nome, prioridade: prioridade, concluida: concluido, ref: nil)
//        self.ref.child("atividades").childByAutoId().setValue(novaAtividade.toAnyObject())
//        self.performSegue(withIdentifier: "CRIADO", sender: self)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CRIADO" {
            if self.atividade == nil {
                self.atividade = Atividade(nome: self.nomeTextView.text,  prioridade:self.prioridadeSegmentedControl.selectedSegmentIndex, concluida: self.concluidoSwitch.isOn, ref: nil)
            }
            let nome:String = nomeTextView.text!
            let prioridade:Int = prioridadeSegmentedControl.selectedSegmentIndex
            let concluido:Bool = concluidoSwitch.isOn
            
            let novaAtividade = Atividade(nome: nome, prioridade: prioridade, concluida: concluido, ref: nil)
            self.ref.child("atividades").childByAutoId().setValue(novaAtividade.toAnyObject())
            self.performSegue(withIdentifier: "CRIADO", sender: self)
            
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

