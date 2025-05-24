from core.queue_manager import QueueManager, Message


fn consume_messages(mut queue: QueueManager):
    while not queue.is_empty():
        var msg = queue.dequeue()
        print("Consumed:", msg.id, "-", msg.payload)
