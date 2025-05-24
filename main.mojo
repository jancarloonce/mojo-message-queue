from core.work_queue import WorkQueue, TaskMessage
from consumers import process_message
from producers import produce_messages
from collections import List


fn main():
    var queue: WorkQueue
    queue = WorkQueue()

    var messages = List[TaskMessage](
        TaskMessage(1, "Task A"),
        TaskMessage(2, "This should fail"),
        TaskMessage(3, "Task B"),
    )

    produce_messages(queue, messages)

    try:
        var msg = queue.queue.popleft()
        var ok = process_message(msg)
        if ok:
            print("Message OK:", msg.id)
        else:
            print("Sending to failed queue:", msg.id)
            queue.failed.append(msg)
    except IndexError:
        print("Queue unexpectedly empty.")
