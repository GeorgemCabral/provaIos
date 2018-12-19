//
//  AtividadeTableViewCell.swift
//  ProvaIos
//
//  Created by Ezequiel Gomes on 19/12/18.
//  Copyright © 2018 br.com.unifor. All rights reserved.
//

import UIKit

class AtividadeTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeAtividade: UILabel!
    @IBOutlet weak var subtituloAtividade: UILabel!
    @IBOutlet weak var prioridade: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
