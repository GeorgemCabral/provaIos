//
//  Atividade.swift
//  ProvaIos
//
//  Created by george on 13/12/18.
//  Copyright © 2018 br.com.unifor. All rights reserved.
//


import UIKit
import Firebase
import FirebaseDatabase

struct Atividade {
    var nome:String?
    var prioridade:Int?
    var concluida:Bool
    var ref: DatabaseReference?
    func toAnyObject() -> Any {
        return ["nome":nome!, "prioridade":prioridade!, "concluida":concluida]
    }
}
