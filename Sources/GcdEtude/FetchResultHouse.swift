import FetchResult

class FetchResultHouse {
  private var latestResults = [String: FetchResult]()

  func newResult(key: String, result: FetchResult) {
    self.latestResults[key] = result
  }
  
  
  func printLatestFetches() {
    print("latestFetches: [")
    for (key, value) in latestResults {
      print("  \(key): \(value)")
    }
    print("]")
  }
}
