
import Dispatch
import Fetcher
import Sleeper
import Reducer
import FetchResult

print("gcd etude")

class Mainer {
  let fetchers = [
    Fetcher(name: "Foo", interval: 1000000 * 2),
    Fetcher(name: "Bar", interval: 1000000 * 4),
    Fetcher(name: "Cow", interval: 1000000 * 4),
    Fetcher(name: "Moose", interval: 1000000 * 3),
  ]


  let fetcherQueue = DispatchQueue(label: "FetcherQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)

  let reducerQueue = DispatchQueue(label: "ReducerQueue", target: DispatchQueue.global(qos: .userInitiated))

  lazy var fetchResultHouse: FetchResultHouse = FetchResultHouse(delegate: self)



  func go() {
    let fetcherSchedulers = fetchers.map() { 
      FetcherScheduler(fetcher: $0, fetcherQueue: self.fetcherQueue, fetchResultHouse: self.fetchResultHouse)
    }
    for f in fetcherSchedulers {
      f.go()
    }
  }
}

extension Mainer: FetchResultHouseDelegate {
  public func newResults(_ results: [String: FetchResult]) {
    print("new results delivered to mainer")
  }
}

let mainer = Mainer()
mainer.go()

