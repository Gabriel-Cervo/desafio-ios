//
//  File.swift
//  
//
//  Created by João Gabriel Dourado Cervo on 17/03/24.
//

import Foundation
import Network
import Core

final class DefaultExtractRepository: ExtractRepositoryProtocol {
    private let networkService: NetworkServiceProtocol
    
    public init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func executeLoad(completionHandler: @escaping ((Result<ExtractList, NetworkError>) -> Void)) {
        do {
            try networkService.request(ExtractList.self, router: ExtractListRoute.fetchData, completionHandler: completionHandler)
        } catch {
            completionHandler(.failure(.generic(error: error)))
        }
    }
}
