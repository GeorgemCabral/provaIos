//
//  TableViewCell.swift
//  ProvaIos
//
//  Created by george on 13/12/18.
//  Copyright © 2018 br.com.unifor. All rights reserved.
//

import UIKit
import Firebase

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var prioridade: UIView!
    
    @IBOutlet weak var nome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
