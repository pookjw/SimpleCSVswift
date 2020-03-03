import Foundation

func LoadCSV(path: String, as: Unicode.UTF8.Type = Unicode.UTF8.self, delimiter: Character = ",") -> [[String]] {
    // Load data.
    guard let data: Data = FileManager.default.contents(atPath: path) else {
        assertionFailure("Loaded data is nil!")
        return []
    }
    
    // Convert to [[String]]
    let str: String = String(decoding: data, as: `as`)
    let arr: [[String]] = str.components(separatedBy: "\n")
        .map {
            $0.components(separatedBy: String(delimiter))
    }
    
    return arr
}

func LoadCSV(url: URL, as: Unicode.UTF8.Type = Unicode.UTF8.self, delimiter: Character = ",") -> [[String]] {
    return LoadCSV(path: url.path, as: `as`, delimiter: delimiter)
}
