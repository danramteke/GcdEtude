
import Dispatch
import Fetcher
import Sleeper
import Reducer

print("gcd etude")

class Mainer {
  let fetchers = [
    Fetcher(name: "Foo", delay: 1),
    Fetcher(name: "Bar", delay: 2),
    Fetcher(name: "Cow", delay: 2),
    Fetcher(name: "Moose", delay: 3),
  ]


  let fetcherQueue = DispatchQueue(label: "FetcherQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)
  let reducerQueue = DispatchQueue(label: "ReducerQueue", target: DispatchQueue.global(qos: .userInitiated))

  var latestFetches = [String: FetchResult]()
  var latestReduction = "" {
    didSet {
      print("new reduction! : \(latestReduction)")
    }
  }

  func printLatestFetches() {
    print("latestFetches: [")
    for (key, value) in latestFetches {
      print("  \(key): \(value)")
    }
    print("]")
  }


  func oneTurn() {
    printLatestFetches()
    for fetcher in self.fetchers {
      self.fetcherQueue.async {
        let result = fetcher.fetch()
        self.latestFetches[fetcher.name] = result
      
      
        self.reducerQueue.async {
          self.latestReduction = Reducer().reduce(self.latestFetches)
        }
      }
    }
  }

}

let mainer = Mainer()

mainer.oneTurn()


while true {
  Sleeper.sleep(seconds: 4)
  
  mainer.oneTurn()

}

//everytime a fetcher returns, recompute the reduction