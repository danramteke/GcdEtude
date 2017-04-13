public class Fetcher {
  public let name: String
  
  public init(name: String) {
    self.name = name
  }


  public func fetch() -> FetchResult {
    // pretend we hit an external data source

    let data = "data for \(self.name)"
    return FetchResult(fetcherName: self.name, data: data)

  }
}

extension Fetcher: CustomStringConvertible {
  public var description: String {
    return "Fetcher(name: \(self.name))"
  }
}
