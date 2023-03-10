//
//  ResponseRepository.swift
//  Manju
//
//  Created by Daize Njounkeng on 3/9/23.
//

import Foundation

protocol ResponseRepositoryProtocol {
    func fetchResponse(completion: (Response)-> Void)
}

final class ResponseRepository: ResponseRepositoryProtocol {
    private let apiService: ResponseApiServiceProtocol

    init(apiService: ResponseApiServiceProtocol = ResponseApiService()){
        self.apiService = apiService
    }

    func fetchResponse(completion: (Response)-> Void){
        apiService.fetchResponse(completion: completion)
    }
}

