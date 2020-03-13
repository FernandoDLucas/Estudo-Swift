//
//  menu.swift
//  nanoSwiftcChallenge
//
//  Created by Fernando de Lucas on 13/03/20.
//  Copyright © 2020 Fernando de Lucas. All rights reserved.
//

import Foundation

func menu(){
    var input :String? = nil
    while input == nil || input == ""{
        print("\t \t \t \t Menu Principal")
        print ("1 - Consultar Cotação")
        print ("2 - Consultar Sigla das Moedas")
        print("\t \t \t \t Selecione a opção:")
        input = readLine()
        if let entrada = input, validaOpcao(txt: entrada){
            switch entrada{
            case "1":
                consultarCotacao()
            case "2":
                consultaSigla()
            default:
                print("Contact the administrator")
            }
        } else {
            print ("Entrada Inválida")
            input = ""
        }
    }
}

func validaOpcao(txt: String) -> Bool{
    return txt == "1" || txt == "2"
}
