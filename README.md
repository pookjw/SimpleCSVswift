# SimpleCSVswift

Really simple CSV functions for Swift!

## Usage

Copy [LoadCSV.swift](CSV/LoadCSV.swift) and [SaveCSV.swift](CSV/SaveCSV.swift) to your project.

### Load CSV file as [[String]]

```swift
// Load CSV from path as String
func LoadCSV(
    path: String,
    as: Unicode.UTF8.Type = Unicode.UTF8.self,
    delimiter: Character = ","
) -> [[String]]

// Load CSV from path as URL
func LoadCSV(
    url: URL,
    as: Unicode.UTF8.Type = Unicode.UTF8.self,
    delimiter: Character = ","
) -> [[String]]
```

### Save CSV file from [[T]] (T: LosslessStringConvertible)

```swift
// Save CSV to path as String
func SaveCSV<T: LosslessStringConvertible>(
    arr: [[T]],
    path: String, as: Unicode.UTF8.Type = Unicode.UTF8.self,
    delimiter: Character = ","
) throws

// Save CSV to path as URL
func SaveCSV<T: LosslessStringConvertible>(
    arr: [[T]],
    url: URL, as: Unicode.UTF8.Type = Unicode.UTF8.self,
    delimiter: Character = ","
) throws
```

## Example

### fruits: [[String]]

```swift
// Save CSV file
let fruits: [[String]] = [["Apple", "Banana"], ["10", "20"]]
try SaveCSV(arr: fruits, path: "/Users/pook/Desktop/fruits.csv")

// Load CSV file from saved CSV file
let loaded_fruits: [[String]] = LoadCSV(path: "/Users/pook/Desktop/fruits.csv")
print(loaded_fruits) // [["Apple", "Banana"], ["10", "20"]]
```

/Users/pook/Desktop/fruits.csv:

| Apple | Banana |
| --- | --- |
| 10 | 20 |

```
Apple,Banana
10,20
```

### numbers: [[Int]]

```swift
// Save CSV file
let numbers: [[Int]] = [[100, 200], [300, 400], [500, 600]]
try SaveCSV(arr: numbers, path: "/Users/pook/Desktop/numbers.csv", as: UTF8.self, delimiter: " ")

// Load CSV file from saved CSV file
let loaded_numbers: [[String]] = LoadCSV(path: "/Users/pook/Desktop/numbers.csv", as: UTF8.self, delimiter: " ")
print(loaded_numbers) // [["100", "200"], ["300", "400"], ["500", "600"]]
```

/Users/pook/Desktop/numbers.csv:

| 100 | 200 |
| --- | --- |
| 300 | 400 |
| 500 | 600 |

```
100 200
300 400
500 600
```
