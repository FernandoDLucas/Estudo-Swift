//
//  consultaSigla.swift
//  nanoSwiftcChallenge
//
//  Created by Fernando de Lucas on 13/03/20.
//  Copyright © 2020 Fernando de Lucas. All rights reserved.
//

import Foundation

func consultaSigla(){
    let descricoes = ["Dólar", "Real Brasileiro", "Euro"]
    let moedaCod = ["USD", "BRL", "EUR"]
    for i in 0...2{
        print("\(padding(descricoes[i], 20)) \(moedaCod[i])")
    }
}
