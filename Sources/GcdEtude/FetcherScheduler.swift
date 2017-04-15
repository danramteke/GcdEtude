import Fetcher
import Dispatch
import FetchResult

class FetcherScheduler {
  let fetcher: Fetcher
  
  weak var fetcherQueue: DispatchQueue?
  weak var fetchResultHouse: FetchResultHouse?
  
  init(fetcher: Fetcher, fetcherQueue: DispatchQueue, fetchResultHouse: FetchResultHouse) {
    self.fetcher = fetcher
    self.fetcherQueue = fetcherQueue
    self.fetchResultHouse = fetchResultHouse
  }
  
  func go() {
    enqueueFetch()
    while true {
      usleep(self.fetcher.interval)  
      enqueueFetch()
    }
  }
  
  private func enqueueFetch() {
    self.fetcherQueue?.async {
        let result = self.fetcher.fetch()
        self.fetchResultHouse?.newResult(key: self.fetcher.name, result: result)
    }
  }
}

extension FetcherScheduler: CustomStringConvertible {
  var description: String {
    return "FetcherScheduler(name: \(fetcher.name))"
  }
}