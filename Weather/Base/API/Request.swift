//
//  Request.swift
//  Weather
//
//  Created by Maxime Lathiere on 21/10/2022.
//

import Foundation

protocol Request {
    associatedtype Output
    var host: String { get }
    var path: String { get }
    var url: URL? { get }
    func decode(_ data: Data) throws -> Output
}

extension Request where Output: Decodable {
  func decode(_ data: Data) throws -> Output {
    let decoder = JSONDecoder()
    return try decoder.decode(Output.self, from: data)
  }
}
