

public class FetchResultHouse {
  private var latestResults = [String: FetchResult]()
  private let block: ([String: FetchResult])->Void
  
  public init(block: @escaping ([String: FetchResult])->Void) { 
    self.block = block
  }
  public func newResult(key: String, result: FetchResult) {
    self.latestResults[key] = result
    block(self.latestResults)
  }
  
  
  public func printLatestFetches() {
    print("latestFetches: [")
    for (key, value) in latestResults {
      print("  \(key): \(value)")
    }
    print("]")
  }
}
