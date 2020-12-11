//
//  FastOrderFetcher.swift
//  FastOrder
//
//  Created by Claus Simonsen on 01/12/2020.
//

import Foundation
import Combine

protocol FastOrderFetchable {
    func queueNumberReservation(forName name: String, phoneNumber: String) -> AnyPublisher<FastOrderQueueReservationResponse, FastOrderError>
}

class FastOrderFetcher {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
}


// MARK: - FastOrderFetchable

extension FastOrderFetcher: FastOrderFetchable {
    func queueNumberReservation(forName name: String, phoneNumber: String) -> AnyPublisher<FastOrderQueueReservationResponse, FastOrderError> {
        return reservation(with: makeQueueNumberReservationComponents(withName: name, phoneNumber: phoneNumber))
    }
    
    private func reservation<T>(with components: URLComponents) -> AnyPublisher<T, FastOrderError> where T: Decodable {
        guard let url = components.url else {
            let error = FastOrderError.network(description: "Error creating URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        var reservationURLRequest = URLRequest(url: url)
        reservationURLRequest.httpMethod = "POST"
        reservationURLRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        reservationURLRequest.httpBody = components.query?.data(using: .utf8)

        return session.dataTaskPublisher(for: reservationURLRequest)
            .print()
            .mapError { error in
                FastOrderError.network(description: error.localizedDescription)
            }
            .flatMap(maxPublishers: .max(1)) { response in
                self.decode(response.data)
            }
            .eraseToAnyPublisher()
    }
}


// MARK: - FastOrder API

private extension FastOrderFetcher {
    struct FastOrderAPI {
        static let scheme = "https"
        static let host = "fastorder-testing.appspot.com"
        static let path = "/api/v1/queue"
    }
    
    func makeQueueNumberReservationComponents(withName name: String, phoneNumber: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = FastOrderAPI.scheme
        components.host = FastOrderAPI.host
        components.path = FastOrderAPI.path
        
        components.queryItems = [
            URLQueryItem(name: "name", value: name),
            URLQueryItem(name: "countryCode", value: "+45"),
            URLQueryItem(name: "phone", value: phoneNumber),
            URLQueryItem(name: "people", value: "0"),
            URLQueryItem(name: "sendQueueSMS", value: "true"),
            URLQueryItem(name: "slug", value: "jayway")
        ]
        
        return components
    }
    
    func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, FastOrderError> {
        let decoder = JSONDecoder()
        
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError { error in
                .parsing(description: error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
