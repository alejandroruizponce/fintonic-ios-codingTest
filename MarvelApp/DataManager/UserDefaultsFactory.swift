
import Foundation

// MARK: - UserDefaultsFactory
class UserDefaultsFactory {
    static func saveCharactersFight(_ characters: [Character]) {
        var charactersRanking: [Character] = getCharactersFight()
        var characterExists: Bool = false
        for character in characters {
            characterExists = false
            if charactersRanking.count > 0 {
                for characterStored in charactersRanking  {
                    if characterStored.name == character.name {
                        characterExists = true
                        break
                    }
                }
                if !characterExists {
                    charactersRanking.append(character)
                }
            } else {
                charactersRanking.append(character)
            }
        }
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(charactersRanking){
           UserDefaults.standard.set(encoded, forKey: "charactersRank")
        }
    }

    static func getCharactersFight() -> [Character] {
        if let objects = UserDefaults.standard.value(forKey: "charactersRank") as? Data {
           let decoder = JSONDecoder()
           if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [Character] {
              var arraySorted = objectsDecoded
              arraySorted.sort(by: { $0.comicsCount > $1.comicsCount })
              return arraySorted
           } else {
              return [Character]()
           }
        } else {
           return [Character]()
        }
    }
}
