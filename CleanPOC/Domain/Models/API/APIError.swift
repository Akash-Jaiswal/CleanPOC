//
//  APIError.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation

// ErrorType
enum APIError: Error {
    case noNetwork(error: Error?)
    case general(error: Error?)
}
