import Moya
import Foundation

public struct NetworkManager<N> where N: TargetType {
    public init() {}
    public var provider = MoyaProvider<N>()
    
    public func request<T: Decodable>(target: N, completion: @escaping (Result<T, RequestError>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                guard let decodedResponse = try? JSONDecoder().decode(T.self, from: response.data) else {
                    completion(.failure(.decode))
                    return
                }
                completion(.success(decodedResponse))
            case .failure(_):
                completion(.failure(.unknown))
            }
        }
    }
}

public protocol NetworkTargetType: TargetType {
    
}

extension NetworkTargetType {
    public var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
    
    public var sampleData: Data {
        return Data()
    }
}


public enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
