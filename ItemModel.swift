import Foundation

struct itemModel: Identifiable {
    var id: String = UUID().uuidString
    let title: String
    var isCompleted = false
    
}
