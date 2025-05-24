
# Mojo Message Queue

A minimal in-memory message queue system built in [Mojo](https://www.modular.com/mojo), Currently in-progress.


## 📁 Project Structure

```
mojomq/
├── core/
│   ├── __init__.mojo
│   └── queue_manager.mojo  
├── main.mojo               
└── README.md
```

## 🛠 Requirements

- [Mojo](https://www.modular.com/mojo) via [Magic CLI](https://docs.modular.com/magic/)
- WSL (if running on Windows)

## 🧪 Running

### Option 1: Quick run
```bash
magic run mojo main.mojo
```

### Option 2: Build and run binary
```bash
magic shell
mojo build main.mojo
./main
```

