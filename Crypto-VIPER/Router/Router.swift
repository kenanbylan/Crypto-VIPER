//
//  Router.swift
//  Crypto-VIPER
//
//  Created by Kenan Baylan on 20.12.2022.
//

import Foundation

//protocol
//entrypoint
//

protocol AnyRouter {
    
    static func startExecution() -> AnyRouter
    
}

class CryptoRouter : AnyRouter {
    
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        
        return router
    }
    
    
}
