//
//  consultarCotacao.swift
//  nanoSwiftcChallenge
//
//  Created by Fernando de Lucas on 13/03/20.
//  Copyright © 2020 Fernando de Lucas. All rights reserved.
//

import Foundation
func consultarCotacao(){
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
    
    var link = "https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=USD&to_currency="
    let apiKey = "&apikey=W7U851QBYFJ4X81C"
    
    print("Insira a sigla da moeda destino: ", terminator: "")
    
    if let moedaDestino = readLine(){
        link = link + moedaDestino.uppercased() + apiKey
    } else {
        print("Sem Input")
        consultarCotacao()
    }
    
    guard let requisicao = URL(string: link) else {fatalError()}
    
    var requisicaoHttp = URLRequest(url: requisicao)
    
    requisicaoHttp.httpMethod = "GET"
    
    URLSession.shared.dataTask(with: requisicaoHttp, completionHandler: handleData).resume()
    
    semaphore.wait()
    
    print("A cotação desta moeda para USD é: \(result.response.exchangeRate)")
}
