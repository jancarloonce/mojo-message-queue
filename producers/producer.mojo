from core.queue_manager import QueueManager, Message
from collections import List


fn produce_messages(mut queue: QueueManager):
    var messages = List[Message](
        Message(1, "Generate report"),
        Message(2, "Send notification"),
        Message(3, "Archive logs"),
    )

    var i: Int = 0
    while i < messages.__len__():
        var msg = messages[i]
        queue.enqueue(msg)
        print("Produced:", msg.id, "-", msg.payload)
        i = i + 1
