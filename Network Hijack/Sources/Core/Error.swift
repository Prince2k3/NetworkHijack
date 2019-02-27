import Foundation

extension NetworkHijack {
    struct Error: LocalizedError {
        private(set) var message: String
        private(set) var error: Swift.Error?
        
        var errorDescription: String? {
            return self.message
        }
        
        init(error: Swift.Error? = nil, message: String) {
            self.error = error
            self.message = message
        }
    }
}

extension NetworkHijack.Error: Equatable {
    static func == (lhs: NetworkHijack.Error, rhs: NetworkHijack.Error) -> Bool {
        return lhs.error?.localizedDescription == rhs.error?.localizedDescription &&
               lhs.message.caseInsensitiveCompare(rhs.message) == .orderedSame
    }
}

extension NetworkHijack.Error {
    static let noResponseFound = NetworkHijack.Error(message: "No route response found")
    static let noClient = NetworkHijack.Error(message: "No client found")
    static let jsonFileBadRead = NetworkHijack.Error(message: "Unable to read JSON file")
    static let routeMissingPath = NetworkHijack.Error(message: "A route is missing its path")
}