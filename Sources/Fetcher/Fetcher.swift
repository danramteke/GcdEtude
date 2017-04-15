import Foundation
import Dispatch
import FetchResult

public class Fetcher {
  public let name: String
  public let interval: DispatchTimeInterval
  
  public init(name: String, interval: DispatchTimeInterval) {
    self.name = name
    self.interval = interval
  }


  public func fetch() -> FetchResult {

    print("[\(self.name)] Fetch started")
    let data = "data for \(self.name)"
          usleep(2 * 1000000)  
    print("[\(self.name)] Fetch ended")
    return FetchResult(fetcherName: self.name, data: data)

  }
}

extension Fetcher: CustomStringConvertible {
  public var description: String {
    return "Fetcher(name: \(self.name))"
  }
}
