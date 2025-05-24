from core.queue_manager import QueueManager, Message


fn main():
    var q = QueueManager()

    var msg1 = Message(1, "Process user signup")
    var msg2 = Message(2, "Send confirmation email")

    q.enqueue(msg1)
    q.enqueue(msg2)

    while not q.is_empty():
        var x = q.dequeue()
        print("Dequeued:", x.id, "-", x.payload)
