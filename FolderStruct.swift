import Foundation

public struct Folder : Codable {
    let id : Int
    let name : String
    let cats : [Category]
}
