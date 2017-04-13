
import Dispatch
import Fetcher

#if os(Linux)
    import Glibc
#else
    import Darwin
#endif

#if DEPLOYMENT_RUNTIME_OBJC || os(Linux)
    import Foundation
#else
    import Foundation
#endif

print("gcd etude")


let fetchers = [
  Fetcher(name: "Foo"),
  Fetcher(name: "Bar"),
  Fetcher(name: "Cow"),
  Fetcher(name: "Moose"),
]

let fetcherGroup = DispatchGroup()
let fetcherQueue = DispatchQueue(label: "FetcherQueue", target: nil)

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