
import Alamofire

// MARK: MarvelAPI
class MarvelAPI {
    
    var parameters: [String: Any] = [
        "ts": Constants.MarvelAPI.ts_value,
        "apikey": Constants.MarvelAPI.apiKey,
        "hash": Constants.MarvelAPI.hash,
        "limit": Constants.MarvelAPI.limit
    ]
    
    func getRequest(with url: String, include parameters: [String: Any], completion: @escaping (_ result: Data?, _ statusSuccess: Bool) -> ()) {
        AF.request(url, method: .get, parameters: parameters)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(data, true)
                case .failure:
                    if response.response != nil {

                    } else {

                    }
                }
        }
    }
}

// MARK: MarvelAPIProtocol
extension MarvelAPI: MarvelAPIProtocol {
    func getCharacters(completion: @escaping (Data?, Bool) -> ()) {
        getRequest(with: Constants.MarvelAPI.baseURL + Constants.MarvelEndpoints.characters, include: parameters, completion: completion)
    }
    
    func getCharactersByName(with name: String, completion: @escaping (Data?, Bool) -> ()) {
        parameters["nameStartsWith"] = name
        getRequest(with: Constants.MarvelAPI.baseURL + Constants.MarvelEndpoints.characters, include: parameters, completion: completion)
    }
    
}
