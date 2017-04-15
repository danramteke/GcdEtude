
import FetchResult

public class Fetcher {
  public let name: String
  public let interval: UInt32
  
  public init(name: String, interval: UInt32) {
    self.name = name
    self.interval = interval
  }


  public func fetch() -> FetchResult {

    print("fetching \(self.name)")
    let data = "data for \(self.name)"
    return FetchResult(fetcherName: self.name, data: data)

  }
}

extension Fetcher: CustomStringConvertible {
  public var description: String {
    return "Fetcher(name: \(self.name))"
  }
}
