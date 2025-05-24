from core.work_queue import WorkQueue, TaskMessage, TrashQueue
from producers import produce_messages
from consumers import process_message
from collections import List


fn main():
    var queue: WorkQueue
    queue = WorkQueue("JobQueue")

    var trash: TrashQueue
    trash = TrashQueue("DeadLetterQueue")

    var messages = List[TaskMessage](
        TaskMessage(1, "Do A"),
        TaskMessage(2, "Will fail"),
        TaskMessage(3, "Do B"),
    )

    produce_messages(queue, messages)
    queue.process_all(process_message, trash)
