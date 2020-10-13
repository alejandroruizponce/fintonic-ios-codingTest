
import Foundation

// MARK: - MarvelAPIProtocol
protocol MarvelAPIProtocol: class {
    func getCharacters(completion: @escaping (_ result: Data?, _ statusSuccess: Bool) -> ())
    func getCharactersByName(with name: String, completion: @escaping (Data?, Bool) -> ())
}
