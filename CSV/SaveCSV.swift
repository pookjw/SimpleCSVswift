import Foundation

func SaveCSV<T: LosslessStringConvertible>(arr: [[T]], url: URL, as: Unicode.UTF8.Type = Unicode.UTF8.self, delimiter: Character = ",") throws {
    // Convert path to URL
    let result: String = arr.map {
        $0.map {
            String($0) // Convert Elements<T: LosslessStringConvertible> to String
        }
        .joined(separator: String(delimiter))
    }
    .joined(separator: "\n")
    
    // Save to url
    try result.write(to: url, atomically: true, encoding: String.Encoding.utf8)
}

func SaveCSV<T: LosslessStringConvertible>(arr: [[T]], path: String, as: Unicode.UTF8.Type = Unicode.UTF8.self, delimiter: Character = ",") throws {
    let url: URL = URL(fileURLWithPath: path)
    try SaveCSV(arr: arr, url: url, as: `as`, delimiter: delimiter)
}

