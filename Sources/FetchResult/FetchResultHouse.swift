

public class FetchResultHouse {
  private var latestResults = [String: FetchResult]()
  public init() { }
  public func newResult(key: String, result: FetchResult) {
    self.latestResults[key] = result
  }
  
  
  public func printLatestFetches() {
    print("latestFetches: [")
    for (key, value) in latestResults {
      print("  \(key): \(value)")
    }
    print("]")
  }
}
