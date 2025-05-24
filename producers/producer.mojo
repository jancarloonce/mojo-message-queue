from core.work_queue import WorkQueue, TaskMessage
from collections import List

fn produce_messages(mut queue: WorkQueue, messages: List[TaskMessage]):
    var i: Int = 0
    while i < messages.__len__():
        var msg = messages[i]
        queue.enqueue(msg)
        print("Produced:", msg.id, "-", msg.payload)
        i = i + 1