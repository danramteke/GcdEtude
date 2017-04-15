
import Dispatch

public class FetchResultHouse {
  private var latestResults = [String: FetchResult]()
  private let block: ([String: FetchResult])->Void
  private let accessQueue = DispatchQueue(label: "ResultHouseAccessQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)
  
  public init(block: @escaping ([String: FetchResult])->Void) { 
    self.block = block
  }
  
  public func newResult(key: String, result: FetchResult) {
    accessQueue.async(flags: .barrier) {
      self.latestResults[key] = result
      let latest = self.latestResults
      DispatchQueue.global().async { [weak self] in
          self?.block(latest) 
      }
    }
  }
  
  public func printLatestFetches() {
    print("latestFetches: [")
    for (key, value) in latestResults {
      print("  \(key): \(value)")
    }
    print("]")
  }
}
