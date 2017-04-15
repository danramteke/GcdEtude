
import Dispatch
import Fetcher
import Sleeper
import Reducer
import FetchResult


print("gcd etude")

class Mainer {

  let fetchers = [
    Fetcher(name: "Foo", interval: .seconds(2)),
    Fetcher(name: "Bar", interval: .seconds(2)),
    Fetcher(name: "Cow", interval: .seconds(4)),
    Fetcher(name: "Moose", interval: .seconds(3)),
  ]

  let semaphore = DispatchGroup()
  let fetcherQueue = DispatchQueue(label: "FetcherQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)
  let schedulerQueue = DispatchQueue(label: "SchedulerQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)
  let reducerQueue = DispatchQueue(label: "ReducerQueue", target: DispatchQueue.global(qos: .userInitiated))

  lazy var fetchResultHouse: FetchResultHouse = FetchResultHouse() { results in
    self.reducerQueue.async {
      Reducer().reduce(results)

    }
  }

  lazy var fetcherSchedulers: [FetcherScheduler] = {
    return self.fetchers.map { k in
      return FetcherScheduler(fetcher: k, fetcherQueue: self.fetcherQueue, fetchResultHouse: self.fetchResultHouse)
    }
  }()


  func go() {
    for f in fetcherSchedulers {
      print(f)
      
      schedulerQueue.async {
        f.go()
      }
      
    }
    

    semaphore.enter()
    semaphore.wait()

  }
}


let mainer = Mainer()
mainer.go()

