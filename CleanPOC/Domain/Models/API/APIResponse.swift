//
//  ApiResponse.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation

enum Response<T>
{
     case success(value: T)
     case failure(error: Error)
}
