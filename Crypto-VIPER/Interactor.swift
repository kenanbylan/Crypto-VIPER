//
//  Interactor.swift
//  Crypto-VIPER
//
//  Created by Kenan Baylan on 20.12.2022.
//

import Foundation

//talks to -> Preenter
//class , protocol
//get data


protocol AnyInteractor {
    
    var presenter : AnyPresenter? { get set }
    
    func downloadCryptos()
    
    
}


class CryptoInteractor : AnyInteractor {
    
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        
        guard let url  = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data , error == nil else {
                self.presenter?.interactorDidDownCrypto(result: .failure(NetworkError.NetworkFailed))
                return
            }
            
            do{
                let cryptos = try? JSONDecoder().decode([Crypto].self, from: data)
                self.presenter?.interactorDidDownCrypto(result: .success(cryptos!))
                
            }catch{
                self.presenter?.interactorDidDownCrypto(result: .failure(NetworkError.ParsingFailed))
                
            }
        }
        
        task.resume()
    }
}
