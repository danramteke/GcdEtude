import Foundation

public class FetchResult {
  public let fetcherName: String
  public let timestamp: Date
  public let data: String
  
  public init(fetcherName: String, data: String) {
    self.fetcherName = fetcherName
    self.timestamp = Date()
    self.data = data
  }
}

extension FetchResult: CustomStringConvertible {
  public var description: String {
    return "{\(fetcherName): \(timestamp)}"
  }
}