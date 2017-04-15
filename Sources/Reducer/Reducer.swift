import FetchResult
import Foundation

public class Reducer {
  public init() {
  }
  public func reduce(_ fetches: [String: FetchResult]) -> String {
    var result = ""
    for (_, value) in fetches {
      result += value.fetcherName
    }
    
    usleep(4 * 1000000) //simulate long running task
    print("[Reducer] \(result)")
    return result
  }
    
}
