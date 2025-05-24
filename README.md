# Mojo Message Queue

A minimal in-memory message queue system built in [Mojo](https://www.modular.com/mojo), designed for educational and modular message processing.
---

## 📁 Project Structure

```
mojomq/
├── core/
│   ├── __init__.mojo
│   └── work_queue.mojo         
├── producers/
│   ├── __init__.mojo
│   └── producer.mojo           
├── consumers/
│   ├── __init__.mojo
│   └── consumer.mojo         
├── main.mojo                   
└── README.md
```

---

## 🛠 Requirements

- [Mojo](https://www.modular.com/mojo) via [Magic CLI](https://docs.modular.com/magic/)
- WSL (Windows Subsystem for Linux) if running on Windows

---

## 🚀 Usage

### Run the project

```bash
magic run mojo main.mojo
```

### Build and run the compiled binary

```bash
magic shell
mojo build main.mojo
./main
```

---