public class Fetcher {
  let name: String
  
  public init(name: String) {
    self.name = name
  }


  public func fetch() -> [String: String] {
    // pretend we hit an external data source
   return [self.name: "data for \(self.name)"]
  }
}

extension Fetcher: CustomStringConvertible {
  public var description: String {
    return "Fetcher(name: \(self.name))"
  }
}
