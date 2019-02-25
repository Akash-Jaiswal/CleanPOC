//
//  Parser.swift
//  CleanPOC
//
//  Created by Jaiswal, Akash on 15/02/19.
//  Copyright © 2019 Jaiswal, Akash. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JsonParser {
    associatedtype T
    func parse(fromJSON json: JSON) -> T
}
