from collections import Deque


struct TaskMessage:
    var id: Int
    var payload: String

    fn __init__(out self: TaskMessage, id: Int, payload: String):
        self.id = id
        self.payload = payload

    fn __copyinit__(out self: TaskMessage, other: TaskMessage):
        self.id = other.id
        self.payload = other.payload

    fn __moveinit__(out self: TaskMessage, owned other: TaskMessage):
        self.id = other.id
        self.payload = other.payload


struct TrashQueue:
    var name: String
    var messages: Deque[TaskMessage]

    fn __init__(out self: TrashQueue, name: String):
        self.name = name
        self.messages = Deque[TaskMessage]()

    fn enqueue(mut self: TrashQueue, msg: TaskMessage):
        print("Moved to TrashQueue:", self.name, "-", msg.id)
        self.messages.append(msg)


struct WorkQueue:
    var name: String
    var queue: Deque[TaskMessage]

    fn __init__(out self: WorkQueue, name: String):
        self.name = name
        self.queue = Deque[TaskMessage]()

    fn enqueue(mut self: WorkQueue, message: TaskMessage):
        print("Enqueued to", self.name, ":", message.id)
        self.queue.append(message)

    fn process_all(
        mut self: WorkQueue,
        handler: fn (TaskMessage) -> Bool,
        mut trash: TrashQueue,
    ):
        var i = 0
        var total = self.queue.__len__()

        while i < total:
            try:
                var msg = self.queue.popleft()
                var ok = handler(msg)
                if not ok:
                    trash.enqueue(msg)
                else:
                    print("Processed from", self.name, ":", msg.id)
            except IndexError:
                print("Queue", self.name, "unexpectedly empty")
            i = i + 1
