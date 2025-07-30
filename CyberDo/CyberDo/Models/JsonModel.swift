//
//  JsonModel.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 30/07/25.
//
import Foundation


struct Conquista: Codable{
    let nome: String
    let descricao: String
    let categoria: String
    let numMax: Int

}

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

class DataWeb: ObservableObject{
    
    @Published var conquistas: [Conquista] = []
    
    func fetchData(urls: String) async throws -> Result<[Conquista], RequestError> {
        
        guard let url = URL(string: urls) else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
     
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let dados = try JSONDecoder().decode([Conquista].self, from: data)
        
        return .success(dados)
        
    }
    
    func getData(url: String) async{
        
        do {
            let result = try await fetchData(urls: url)
            switch result {
            case .success(let data):
                
                conquistas = data
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        } catch {
            print(error.localizedDescription)
            
        }
    }
}
