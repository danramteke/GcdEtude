public protocol FetchResultHouseDelegate: class {
  func newResults(_ results: [String: FetchResult])
}

public class FetchResultHouse {
  private var latestResults = [String: FetchResult]()
  private weak var delegate: FetchResultHouseDelegate?
  
  public init(delegate: FetchResultHouseDelegate) { 
    self.delegate = delegate
  }
  public func newResult(key: String, result: FetchResult) {
    self.latestResults[key] = result
    delegate?.newResults(self.latestResults)
  }
  
  
  public func printLatestFetches() {
    print("latestFetches: [")
    for (key, value) in latestResults {
      print("  \(key): \(value)")
    }
    print("]")
  }
}
