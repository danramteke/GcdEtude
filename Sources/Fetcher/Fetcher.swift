import Sleeper

public class Fetcher {
  public let name: String
  public let delay: Int
  
  public init(name: String, delay: Int) {
    self.name = name
    self.delay = delay
  }


  public func fetch() -> FetchResult {
    Sleeper.sleep(seconds: delay)

    let data = "data for \(self.name)"
    return FetchResult(fetcherName: self.name, data: data)

  }
}

extension Fetcher: CustomStringConvertible {
  public var description: String {
    return "Fetcher(name: \(self.name))"
  }
}
