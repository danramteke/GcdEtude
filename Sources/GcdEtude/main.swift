
import Dispatch

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



//
//let scheduler = Scheduler()
//scheduler.run()


while true {
  let oneSecond: UInt32 = 1000000
  usleep(3 * oneSecond)
  print("sleeping")
}