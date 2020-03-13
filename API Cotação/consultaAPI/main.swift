//
//  main.swift
//  nanoSwiftc]
//
//  Created by Fernando de Lucas on 10/03/20.
//  Copyright © 2020 Fernando de Lucas. All rights reserved.
//

import Foundation
func padding(_ txt: String, _ width : Int) -> String{
    let length = txt.count
    guard length < width else {
        return txt
    }
    let spaces = Array<Character>.init(repeating: " ", count: width - length)
    return txt + spaces
}

func consultaSigla(){
    let descricoes = ["Dólar", "Real Brasileiro", "Euro"]
    let moedaCod = ["USD", "BRL", "EUR"]
    for i in 0...2{
        print("\(padding(descricoes[i], 20)) \(moedaCod[i])")
    }
}


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
                print("Consultando Cotação")
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

menu()


var test = CurrencyExchangeRate ()

var result : json

result = json(response: test)

let semaphore = DispatchSemaphore(value: 0)

func handleData(data: Data?, response: URLResponse?, error: Error?){
    if error != nil || data == nil {
        print("Client error!")
        return
    }
    
    guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
        print("Server error!")
        return
    }
    
    do {
        let decoder = JSONDecoder()
        let jsonFinal = try decoder.decode(json.self, from: data!)
        result = jsonFinal
        semaphore.signal()
    } catch  {
        print(error)
    }
}

var moedaDestino : String

var link = "https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=USD&to_currency="
var apiKey = "&apikey=W7U851QBYFJ4X81C"

print("Insira a sigla da moeda destino: ", terminator: "")

if let moedaDestino = readLine(){
    link = link + moedaDestino.uppercased() + apiKey
} else {
    print("Sem Input")
}

guard let requisicao = URL(string: link) else {fatalError()}

var requisicaoHttp = URLRequest(url: requisicao)

requisicaoHttp.httpMethod = "GET"

URLSession.shared.dataTask(with: requisicaoHttp, completionHandler: handleData).resume()

semaphore.wait()

print("A cotação desta moeda para USD é: \(result.response.exchangeRate)")
