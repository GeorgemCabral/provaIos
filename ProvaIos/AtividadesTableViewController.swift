//
//  AtividadesTableViewController.swift
//  ProvaIos
//
//  Created by george on 13/12/18.
//  Copyright © 2018 br.com.unifor. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AtividadesTableViewController: UITableViewController {
    
    var ref: DatabaseReference! = Database.database().reference()
    var atividades = [Atividade]()
    
    @IBAction func logoutClicked(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        try? firebaseAuth.signOut()
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Carga Inicial
        self.ref.child("atividades").observeSingleEvent(of:.value, with: { (snapshot) in
            self.atividades.removeAll()
            for childSnapshot in snapshot.children {
                let child = childSnapshot as! DataSnapshot
                let value = child.value as! [String: Any]
                
                let newItem = Atividade(nome: value["nome"] as? String, prioridade: value["prioridade"] as? Int, concluida: value["concluida"] as! Bool, ref:child.ref)
                
                self.atividades.append(newItem)
                self.tableView.reloadData()
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return atividades.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Celula", for: indexPath)
        
        let atividade = atividades[indexPath.row]
        
        cell.textLabel?.text = atividade.nome
        
        if(atividade.concluida){
            cell.detailTextLabel?.text = "Concluída"
        }else{
            cell.detailTextLabel?.text = "Não Concluída"
        }
        
        switch atividade.prioridade {
        case 0:
            cell.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            break
        case 1:
            cell.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            break
        default:
            cell.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            break
        }
        
        return cell
    }
    
    @IBAction func unwindAtividades(segue:UIStoryboardSegue) -> Void {
        
        if(segue.identifier == "criado") {
            if let svc = segue.source as? NovaAtividadeViewController {
               
                if let atividade = svc.atividade {
                    let novaAtividade = Atividade(nome: atividade.nome,
                                       prioridade: atividade.prioridade,
                                       concluida: atividade.concluida,
                                       ref:nil)
                    
                    self.ref.child("atividades").childByAutoId().setValue(novaAtividade.toAnyObject())
                }
                
            }
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
