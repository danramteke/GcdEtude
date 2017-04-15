
import FetchResult

public class Fetcher {
  public let name: String
  public let interval: UInt32
  
  public init(name: String, interval: UInt32) {
    self.name = name
    self.interval = interval
  }


  public func fetch() -> FetchResult {

    print("[\(self.name)] Fetch started")
    let data = "data for \(self.name)"
    print("[\(self.name)] Fetch ended")
    return FetchResult(fetcherName: self.name, data: data)

  }
}

extension Fetcher: CustomStringConvertible {
  public var description: String {
    return "Fetcher(name: \(self.name))"
  }
}
