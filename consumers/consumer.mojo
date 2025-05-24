from core.work_queue import TaskMessage


fn process_message(msg: TaskMessage) -> Bool:
    if msg.id == 2:
        print("Simulating failure for:", msg.id)
        return False
    print("Processed:", msg.id, "-", msg.payload)
    return True
