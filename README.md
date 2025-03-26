# 🚀 Secure IPC Framework - Pub/Sub System

## 📌 Overview

This project implements a **Publish-Subscribe (Pub/Sub) system** as an **Inter-Process Communication (IPC) framework**, focusing on **security and performance**. It enables efficient message distribution between multiple components while ensuring **tamper-proof communication**. 🔐

## 🛠️ Technologies Used

- **📂 GIT**: Used as a version control system for tracking changes and collaborating.
- **💻 IDE**: Microsoft VS Code for code development and debugging.
- **🐧 OS**: Ubuntu _(Mac users can use LIMA emulators or a VM)._
  - _🔹 Reason:_ Mac’s native file system and process handling differ from Linux-based environments. **Mac does not natively support some low-level IPC mechanisms like System V shared memory and message queues**. LIMA provides a lightweight way to run Linux tools natively without needing a full VM, making it ideal for Mac users working on Unix-based projects.
- **🐞 Debugging Tools**: GNU Debugger (GDB) for testing and debugging C-based implementations.

## 🌍 Real-Life Use Cases of Pub/Sub Systems

The **Pub/Sub model** is a fundamental IPC concept widely used in various real-world applications:

1. **💬 Messaging Systems** (e.g., Kafka, RabbitMQ, MQTT) → Used for chat apps, notification services, and distributed logging.
2. **🔗 Microservices Communication** → Helps microservices interact asynchronously without being tightly coupled.
3. **📈 Stock Market Feeds** → Real-time stock trading platforms update traders instantly with price fluctuations.
4. **🏡 IoT Networks** → Smart home devices communicate securely using Pub/Sub to exchange sensor data and commands.
5. **🎮 Gaming & 📡 Real-Time Streaming** → Multiplayer games and live-streaming platforms rely on Pub/Sub for synchronized event handling.

## 🔒 Importance of Security in Pub/Sub Systems

Since Pub/Sub systems deal with **real-time message distribution**, security is a major concern. Here’s why:

- **🚫 Preventing Unauthorized Access** → Without authentication, **malicious subscribers** can eavesdrop on sensitive messages.
- **✅ Data Integrity & Tamper Protection** → Attackers can **modify or inject fake messages**, leading to incorrect data processing.
- **💥 Denial of Service (DoS) Attacks** → Unsecured brokers can be flooded with junk messages, causing service disruptions.
- **🔑 Encryption for Data Privacy** → Messages must be **encrypted in transit** to prevent interception by third parties.
- **👤 Authentication & Authorization** → Only verified publishers and subscribers should be allowed to communicate.

### 🛠️ How TLV Enhances Our Pub/Sub Framework?

- **🛠️ Encapsulates Message Data**: Ensures messages are **self-contained and structured**.
- **⏳ Improves Processing Speed**: Since messages are well-formed, they can be **parsed faster**.
- **🔒 Security Integration**: TLV fields can be **encrypted**, ensuring **end-to-end security** in message transmission.

## 📚 Knowledge Base

- **What is an IPC?** → [GeeksforGeeks - IPC Overview](https://www.geeksforgeeks.org/inter-process-communication-ipc/)
- **What is a Pub/Sub Architecture?** → [GeeksforGeeks - Pub/Sub](https://www.geeksforgeeks.org/what-is-pub-sub/)

## 📌 Roadmap

- [x] Implement Pub-Sub Messaging Core
- [x] Add Multi-Threading Support
- [x] Implement Message Encryption & Authentication
- [ ] Integrate Dynamic Scaling
- [ ] Develop Comprehensive Test Suite

## 🎯 Conclusion

The **Secure IPC Pub/Sub Framework** ensures **efficient, real-time, and secure communication** between processes while preventing common security threats. 🔥 As IPC plays a crucial role in modern applications, making it **robust and attack-resistant** is vital for maintaining **system reliability and confidentiality**. 🛡️
