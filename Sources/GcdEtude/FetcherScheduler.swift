import Fetcher
import Dispatch
import FetchResult

class FetcherScheduler {
  let fetcher: Fetcher
  
  weak var fetchResultHouse: FetchResultHouse?
  let timer: DispatchSourceTimer
  
  init(fetcher: Fetcher, fetcherQueue: DispatchQueue, fetchResultHouse: FetchResultHouse) {
    self.fetcher = fetcher
    self.fetchResultHouse = fetchResultHouse
    
    self.timer = DispatchSource.makeTimerSource(queue: fetcherQueue)
  }
  
  func go() {
  
    self.timer.scheduleRepeating(deadline: .now(), interval: fetcher.interval, leeway: .seconds(1))

    self.timer.setEventHandler { [weak self] in 
      self?.enqueueFetch()
    }

    self.timer.resume()

  }
  
  private func enqueueFetch() {
    let result = self.fetcher.fetch()
    self.fetchResultHouse?.newResult(key: self.fetcher.name, result: result)
  }
}

extension FetcherScheduler: CustomStringConvertible {
  var description: String {
    return "FetcherScheduler(name: \(fetcher.name))"
  }
}