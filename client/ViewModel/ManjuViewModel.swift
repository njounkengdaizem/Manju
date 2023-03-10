//
//  ManjuViewModel.swift
//  Manju
//
//  Created by Daize Njounkeng on 3/9/23.
//

import Foundation

final class ManjuViewModel: ObservableObject{
    
    @Published var response = ["Hardcoded test here"]
    
    private let repository: ResponseRepositoryProtocol
    
    init (repository: ResponseRepositoryProtocol = ResponseRepository()){
        self.repository = repository
    }
    
    func onAppear (){
        repository.fetchResponse { res in
            self.response = res.response
        }
    }
    
}
