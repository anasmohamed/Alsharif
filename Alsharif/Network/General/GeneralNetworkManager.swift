//
//  GeneralNetworkManager.swift
//  client
//
//  Created by moumen isawe on 07/01/2022.
//

 
import Foundation
import Moya

protocol GeneralNetworkabke:Networkable{
     
    func getAllRealties(completion: @escaping (Result<RealState, Error>) -> ())
}
final class GeneralNetworkManager:GeneralNetworkabke{

    
   
    
  
    

    typealias targetType = GeneralTarget
    
    
    
    var provider =  MoyaProvider<GeneralTarget>(plugins: [NetworkLoggerPlugin(),  AccessTokenPlugin { target in
        
        return AppData.token
    }])
    
    public static var shared: GeneralNetworkManager = {
        let instance = GeneralNetworkManager()
        
        return instance
    }()
    
    func getAllRealties(completion: @escaping (Result<RealState, Error>)->()) {
        request(target: .getAllRealties, completion: completion)
    }
    
}
