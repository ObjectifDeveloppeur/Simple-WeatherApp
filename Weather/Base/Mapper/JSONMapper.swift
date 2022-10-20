//
//  JSONMapper.swift
//  Weather
//
//  Created by Maxime Lathiere on 19/10/2022.
//

import Foundation


enum JSONMapper {
    static func decode<T: Decodable>(fileName: String, type: T.Type) throws -> T {
        
        guard !fileName.isEmpty,
              let path = Bundle.main.path(forResource: fileName, ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            throw MappingError.failedToGetContents
        }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.weatherDateFormatter)
        return try decoder.decode(T.self, from: data)
    }
}

extension JSONMapper {
    enum MappingError: Error {
        case failedToGetContents
    }
}
