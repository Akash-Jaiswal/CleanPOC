//
//  APIManager.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


class APIManager:APIService {
    
    
    // MARK: - Protocol Properties
    static let shared = APIManager(baseURL: Api.BaseUrl)
    private var baseURL: String = ""
    private let sessionManager = Alamofire.SessionManager()
    
    
    required init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    
    func call(withAPIModel apiModel: APIModel,
              completion: ((Response<JSON>) -> Void)?) {
        
        guard let method = HTTPMethod(rawValue: apiModel.method.rawValue) else {
            completion?(Response.failure(error: APIError.general(error: nil)))
            return
        }
        
        var encoding: ParameterEncoding
        if apiModel.paramsEncoding == .urlEncoded {
            encoding = URLEncoding.default
        } else {
            encoding = JSONEncoding.default
        }
        
        sessionManager.request(self.baseURL + apiModel.url,
                               method: method,
                               parameters: apiModel.params,
                               encoding: encoding,
                               headers: apiModel.headers)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion?(Response.success(value: JSON(data)))
                case .failure(let error):
                    if let err = error as? URLError, case .notConnectedToInternet = err.code {
                        let errorAPI = APIError.noNetwork(error: error)
                        completion?(Response.failure(error: errorAPI))
                    } else {
                        let errorAPI = APIError.general(error: error)
                        completion?(Response.failure(error: errorAPI))
                    }
                }
        }
    }
}


