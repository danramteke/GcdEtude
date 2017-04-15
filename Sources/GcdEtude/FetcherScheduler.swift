import Fetcher
import Dispatch
import FetchResult

class FetcherScheduler {
  let fetcher: Fetcher
  
  weak var fetcherQueue: DispatchQueue?
  weak var fetchResultHouse: FetchResultHouse?
  
  let timerQueue: DispatchQueue
  let timer: DispatchSourceTimer
  
  init(fetcher: Fetcher, fetcherQueue: DispatchQueue, fetchResultHouse: FetchResultHouse) {
    self.fetcher = fetcher
    self.fetcherQueue = fetcherQueue
    self.fetchResultHouse = fetchResultHouse
    
    self.timerQueue = DispatchQueue(label: "com.firm.app.timer", attributes: .concurrent)
    self.timer = DispatchSource.makeTimerSource(queue: timerQueue)
  }
  
  func go() {
  
    self.timer.scheduleRepeating(deadline: .now(), interval: fetcher.interval, leeway: .seconds(1))

    self.timer.setEventHandler { [weak self] in 
      self?.enqueueFetch()
    }

    self.timer.resume()

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