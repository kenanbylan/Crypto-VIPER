//
//  Presenter.swift
//  Crypto-VIPER
//
//  Created by Kenan Baylan on 20.12.2022.
//

import Foundation

//class ,protocol
//talks to -> interactor, router , view 


enum NetworkError : Error {
    case NetworkFailed
    case ParsingFailed
}


protocol AnyPresenter {
    
    var router : AnyRouter? { get set }
    var interactor : AnyInteractor? {get set}
    var view : AnyView? { get set }
    
    func interactorDidDownCrypto(result : Result<[Crypto], Error>)
    

}


    class Presenter : AnyPresenter {
        
        var router: AnyRouter?
        
        var interactor: AnyInteractor?
        
        var view: AnyView?
        
        func interactorDidDownCrypto(result: Result<[Crypto], Error>) {
            
            switch result {
            case .success(let cryptos):
                //update
                print("update")
            case .failure(let error):
                //print(error)
                print("error")
            }
        }
        
        
   
}
