import FetchResult

public class Reducer {
  public init() {
  }
  public func reduce(_ fetches: [String: FetchResult]) -> String {
    var result = ""
    for (key, value) in fetches {
      result += value.fetcherName
    }
    return result
  }
    
}
