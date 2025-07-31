//
//  JsonModel.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 30/07/25.
//
import Foundation


/// struct de conquista, serve para poder decodificar o json e usar seu conteudo
struct Conquista: Codable{
    let nome: String
    let descricao: String
    let categoria: String
    let numMax: Int

}

/// Enum que retorna erros ao tentar fazer uma requisição get
enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
}

/// Classe que faz a requisição get e a converte para um array
class DataWeb: ObservableObject{
    
    @Published var conquistas: [Conquista] = []
    
    /// função que puxa os dados da web
    /// - Parameter urls: url onde estao os dados
    /// - Returns: retorna uma lista de conquista, que sera armazenada na variavel conquistas da classe
    private func fetchData(urls: String) async throws -> Result<[Conquista], RequestError> {
        
        guard let url = URL(string: urls) else {
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
     
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let dados = try JSONDecoder().decode([Conquista].self, from: data)
        
        return .success(dados)
        
    }
    
    /// Função que trata os possiveis erros ao tentar puxar um dado da web
    /// - Parameter url: url onde esse dado se encontra
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
