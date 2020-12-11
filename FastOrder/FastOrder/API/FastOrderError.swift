//
//  FastOrderError.swift
//  FastOrder
//
//  Created by Claus Simonsen on 01/12/2020.
//

import Foundation

enum FastOrderError: Error {
    case parsing(description: String)
    case network(description: String)
}
