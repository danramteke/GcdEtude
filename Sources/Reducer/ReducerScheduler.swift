import FetchResult
import Dispatch
import Foundation

public class ReducerScheduler {
  public init() {}

  private var items = [UUID: DispatchWorkItem]()
  
  private let itemsAccessQueue = DispatchQueue(label: "ReducerSchedulerItemsAccessQueue", attributes: DispatchQueue.Attributes.concurrent, target: nil)
  
  private let reducerQueue = DispatchQueue(label: "ReducerQueue", target: DispatchQueue.global(qos: .userInitiated))

  public func reduce(_ results: [String: FetchResult]) {
    print("adding a reduction: \(self.items)")
    let item = DispatchWorkItem() { 
      _ = Reducer().reduce(results) 
    }
  
    let uuid = UUID()
    self.appendItem(item, forUuid: uuid)

    self.reducerQueue.async(execute: item)
    
    item.notify(queue: self.itemsAccessQueue) { [weak self] in
      self?.removeItemForUuid(uuid)
    }
  }
  
  private func appendItem(_ item: DispatchWorkItem, forUuid uuid: UUID) {
    self.itemsAccessQueue.async(flags: .barrier) { [weak self] in
      for (key, value) in self?.items ?? [:] {
        value.cancel()
        self?.items.removeValue(forKey: key)
      }
      print("dict size: \(self?.items.count ?? 0)")
      self?.items[uuid] = item
    }
  }
  
  private func removeItemForUuid(_ uuid: UUID) {
    itemsAccessQueue.async(flags: .barrier) { [weak self] in
      print("removing item for key: \(uuid)")
      self?.items.removeValue(forKey: uuid)
    }
  }
}
