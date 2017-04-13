
import Dispatch
import Fetcher



print("gcd etude")


let fetchers = [
  Fetcher(name: "Foo"),
  Fetcher(name: "Bar"),
  Fetcher(name: "Cow"),
  Fetcher(name: "Moose"),
]


let fetcherQueue = DispatchQueue(label: "FetcherQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)

while true {
  let oneSecond: UInt32 = 1000000
  usleep(3 * oneSecond)
  for fetcher in fetchers {
    fetcherQueue.async(execute: DispatchWorkItem(block: {
      fetcher.fetch()
    }))
  }
  print("sleeping")
}