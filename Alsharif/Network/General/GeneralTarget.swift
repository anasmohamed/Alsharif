//
//  GeneralTarget.swift
//  client
//
//  Created by moumen isawe on 07/01/2022.
//

import Foundation

import Moya

enum GeneralTarget: TargetType ,AccessTokenAuthorizable{

    
 
    case getAllRealties
 
    
    var baseURL: URL{
        return URL(string: "\(AppConfig.apiBaseUrl)")!

    }
    
    var path: String{
        switch self {
         

            
       
        case .getAllRealties:
            return "captin/all"
     
        }
        
    }
    
    var method: Moya.Method {
        switch self{

      
        case .getAllRealties:
                return .get
        
        }
    }
    
    
    var task: Task{
        switch self{
//        case .contact:
//            return .requestParameters(parameters: param, encoding: URLEncoding.httpBody)
       
        case .getAllRealties:
            return .requestPlain
            
            
            
             
//
//            let imagePart = MultipartFormData(provider: .data(image),   name: "image", fileName: "images", mimeType: "image/png")
//            let distancePart = MultipartFormData(provider: .data(Data(from: distance)), name: "distance")
//            let detailsPart = MultipartFormData(provider: .data(details.toData) , name: "details")
//            let typePart = MultipartFormData(provider: .data("documents".toData), name: "type")
//            let address = MultipartFormData(provider: .data(type.toData), name: "address")
//
//            let multipartData = [imagePart,distancePart,detailsPart,typePart,address]
//
//                      return .uploadMultipart(multipartData)
        }
    }
    
    
    var headers: [String : String]?{
        switch self{
        
//        case .addShipment:
//            return ["Accept":"*/*"]
      
        default:return ["Accept":"application/json"]
        }
    }
    
    var param: [String : Any]{
        
        switch self {
        
        default : return [:]

        }
}
    var authorizationType: AuthorizationType? {
          switch self {
          case .getAllRealties:
                  return .bearer
              
              
              default:
                  return nil
              }
          }
}
 
 
extension String{
    var toData:Data{
        get{
            return self.data(using: .utf8)!
        }
    }
}
extension Data {

    init<T>(from value: T) {
        self = Swift.withUnsafeBytes(of: value) { Data($0) }
    }

    func to<T>(type: T.Type) -> T? where T: ExpressibleByIntegerLiteral {
        var value: T = 0
        guard count >= MemoryLayout.size(ofValue: value) else { return nil }
        _ = Swift.withUnsafeMutableBytes(of: &value, { copyBytes(to: $0)} )
        return value
    }
}
