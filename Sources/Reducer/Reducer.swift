import FetchResult

public class Reducer {
  public init() {
  }
  public func reduce(_ fetches: [String: FetchResult]) -> String {
    var result = ""
    for (_, value) in fetches {
      result += value.fetcherName
    }
    print("[Reducer] \(result)")
    return result
  }
    
}
