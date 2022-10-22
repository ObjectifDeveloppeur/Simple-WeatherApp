//
//  NetworkinManager.swift
//  Weather
//
//  Created by Maxime Lathiere on 21/10/2022.
//

import Foundation

protocol Networking {
    func fetch<R: Request>(_ request: R) async throws -> R.Output
}

struct NetworkinManager: Networking {
    func fetch<R: Request>(_ request: R) async throws -> R.Output {
        guard let url = request.url else {
            throw Error.invalidURL
        }

        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let response = response as? HTTPURLResponse,
              (200...300) ~= response.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw Error.invalidStatusCode(statusCode: statusCode)
        }
        
        do {
            return try request.decode(data)
        } catch {
            throw Error.failedToDecode(error: error)
        }
    }
}

extension NetworkinManager {
    enum Error: LocalizedError {
        case invalidURL
        case invalidStatusCode(statusCode: Int)
        case failedToDecode(error: Swift.Error)
        case custom(error: Swift.Error)
    }
}

extension NetworkinManager.Error {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidStatusCode(let statusCode):
            return "The server returned an error: code \(statusCode)"
        case .failedToDecode(let error):
            return "Failed to decode: \(error.localizedDescription)"
        case .custom(let error):
            return "Something went wrong: \(error.localizedDescription)"
        }
    }
}
