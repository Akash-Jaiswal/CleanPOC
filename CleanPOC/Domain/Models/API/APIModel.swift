//
//  APIModel.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 17/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation
struct APIModel {
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    enum Encoding {
        case urlEncoded
        case json
    }
    var method: HTTPMethod
    var url: String
    var headers: [String: String]?
    var params: [String: Any]?
    var paramsEncoding: Encoding
}
