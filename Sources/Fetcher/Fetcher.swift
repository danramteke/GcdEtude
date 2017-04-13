public class Fetcher {
  public let name: String
  
  public init(name: String) {
    self.name = name
  }


  public func fetch() -> String {
    // pretend we hit an external data source
    print("Fetching: \(self.name)")
   return "data for \(self.name)"
  }
}

extension Fetcher: CustomStringConvertible {
  public var description: String {
    return "Fetcher(name: \(self.name))"
  }
}
