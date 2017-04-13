import Foundation

public class Sleeper {
  private static let oneSecond: UInt32 = 1000000
  public class func sleep(seconds: Int) {
    usleep(oneSecond * UInt32(seconds))
  }
}