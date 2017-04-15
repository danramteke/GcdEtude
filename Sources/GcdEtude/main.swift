
import Dispatch
import Fetcher
import Sleeper
import Reducer
import FetchResult

print("gcd etude")

class Mainer {
  let fetchers = [
    Fetcher(name: "Foo", interval: 1000000 * 4),
    Fetcher(name: "Bar", interval: 1000000 * 4),
    Fetcher(name: "Cow", interval: 1000000 * 4),
    Fetcher(name: "Moose", interval: 1000000 * 4),
  ]


  let fetcherQueue = DispatchQueue(label: "FetcherQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)
  let fetchResultHouse = FetchResultHouse()
  let reducerQueue = DispatchQueue(label: "ReducerQueue", target: DispatchQueue.global(qos: .userInitiated))




  func go() {
    let fetcherSchedulers = fetchers.map() { 
      FetcherScheduler(fetcher: $0, fetcherQueue: self.fetcherQueue, fetchResultHouse: self.fetchResultHouse)
    }
    for f in fetcherSchedulers {
      f.go()
    }
  }
}

let mainer = Mainer()
mainer.go()

