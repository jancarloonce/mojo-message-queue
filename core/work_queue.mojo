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


struct WorkQueue:
    var queue: Deque[TaskMessage]
    var failed: Deque[TaskMessage]

    fn __init__(out self: WorkQueue):
        self.queue = Deque[TaskMessage]()
        self.failed = Deque[TaskMessage]()

    fn enqueue(mut self: WorkQueue, item: TaskMessage):
        self.queue.append(item)

    fn try_process(mut self: WorkQueue, mut handler: fn (TaskMessage) -> Bool):
        try:
            var message = self.queue.popleft()
            var success = handler(message)

            if not success:
                print("Message failed, moved to FailedQueue")
                self.failed.append(message)
            else:
                print("Message processed:", message.id)
        except IndexError:
            print("dasda")
