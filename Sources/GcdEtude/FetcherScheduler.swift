import Fetcher
import Dispatch
import FetchResult

class FetcherScheduler {
  let fetcher: Fetcher
  let interval: UInt32
  
  weak var fetcherQueue: DispatchQueue?
  weak var fetchResultHouse: FetchResultHouse?
  
  init(fetcher: Fetcher, interval: UInt32, fetcherQueue: DispatchQueue, fetchResultHouse: FetchResultHouse) {
    self.fetcher = fetcher
    self.interval = interval
    self.fetcherQueue = fetcherQueue
    self.fetchResultHouse = fetchResultHouse
  }
  
  func go() {
    oneTurn()
    while true {
      usleep(self.interval)  
      oneTurn()
    }
  }
  
  private func oneTurn() {
    self.fetcherQueue?.async {
        let result = self.fetcher.fetch()
        self.fetchResultHouse?.newResult(key: self.fetcher.name, result: result)
    }
  }
}