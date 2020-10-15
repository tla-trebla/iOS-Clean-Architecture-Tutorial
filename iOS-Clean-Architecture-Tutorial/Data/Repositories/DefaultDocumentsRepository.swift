//
//  DefaultDocumentsRepository.swift
//  iOS-Clean-Architecture-Tutorial
//
//  Created by Albert Pangestu on 15/10/20.
//

import Foundation

protocol DocumentsRepository {
    func fetchDocumentsList(requestValue: SearchDocumentsUseCaseRequestDTO,
                            completion: @escaping (Result<[Document], Error>) -> Void)
}

final class DefaultDocumentsRepository: DocumentsRepository {
    
    private let storage : DocumentsStorage
    
    init(storage: DocumentsStorage) {
        self.storage = storage
    }
    
    func fetchDocumentsList(requestValue: SearchDocumentsUseCaseRequestDTO, completion: @escaping (Result<[Document], Error>) -> Void) {
        storage.fetchDocuments(requestDTO: requestValue) { result in
            switch result {
            case .success(let documents):
                completion(.success(documents))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
