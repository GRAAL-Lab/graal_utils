# Panda Robots Setup

This documents describes the basic configuration info of the Panda Robots setup.


## Network Configuration

- **Robot 1** IP: `130.251.6.11`
- **Robot 2** IP: `130.251.6.12`
- **Control PC** IP (Ubuntu VirtualBox): `130.251.6.21`


## Access Dashboard

To access the robots dashboard:
1. Power on the FCI (Franka Control Interface, placed below the robot desk)
2. Wait a couple of seconds and then type the robot's IP in a web browser (i.e. https://130.251.6.11)
3. Log-in with the following credentials:
  - user: graal
  - pwd: graalgraal


## Robot status-LED meaning

- 🟨 *Yellow* : Joints Locked
- 🟦 *Blue*   : Ready for tasks
- 🟩 *Green*  : Executing tasks
- ⬜ *White*  : Cobot-mode (hand-controlled)
- 🟪 *Purple* : Conflicting safety measures (if in hand-controlled, push safety button to operate)
