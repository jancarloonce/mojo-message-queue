from collections import Deque


struct Message:
    var id: Int
    var payload: String

    fn __init__(mut self: Message, id: Int, payload: String):
        self.id = id
        self.payload = payload

    fn __copyinit__(mut self: Message, other: Message):
        self.id = other.id
        self.payload = other.payload

    fn __moveinit__(mut self: Message, owned other: Message):
        self.id = other.id
        self.payload = other.payload


struct QueueManager:
    var queue: Deque[Message]

    fn __init__(mut self: QueueManager):
        self.queue = Deque[Message]()

    fn enqueue(mut self: QueueManager, item: Message):
        self.queue.append(item)

    fn dequeue(mut self: QueueManager) -> Message:
        try:
            return self.queue.popleft()
        except IndexError:
            print("Queue is empty!")
            return Message(0, "EMPTY")

    fn is_empty(self: QueueManager) -> Bool:
        return self.queue.__len__() == 0

    fn size(self: QueueManager) -> Int:
        return self.queue.__len__()
