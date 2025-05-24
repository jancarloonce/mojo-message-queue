from core.queue_manager import QueueManager
from producers.producer import produce_messages
from consumers.consumer import consume_messages


fn main():
    var queue = QueueManager()

    produce_messages(queue)
    consume_messages(queue)
