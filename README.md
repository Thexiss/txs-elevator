### Credits

This script was developed by **IIPLAX** and uses the **qb-core** framework along with **qb-target** for interaction. 

### Contact and Support:
- For inquiries or support, join the Discord community: [Thexis Discord Store](https://discord.gg/txs)
- Discord: [Thexis Discord Store](https://discord.gg/txs) for any questions or custom script requests.


# QB-Core Elevator Script

## Description

This is a fully dynamic **elevator script** for **QB-Core** frameworks, designed for GTA V Roleplay servers. The script allows players to interact with elevators in-game, navigate between floors, and display a dynamic UI that shows the available floors. It also highlights the player's current floor, enhancing the realism and user experience.

## Features

- **Dynamic Floor System**: Floors are dynamically added from the config file.
- **Interactive UI**: A clean and responsive NUI interface allows players to select floors.
- **Current Floor Highlighting**: The floor the player is currently on is highlighted in the UI.
- **Customizable**: Easily add elevators and floors in the config file.
- **Keybinding**: The **ESC** key closes the menu.
- **QB-Target Integration**: Interact with elevators using qb-target.

## Installation

Follow these steps to install the **QB-Core Elevator Script** on your server.

### Prerequisites
- **qb-core** installed on your server.
- **qb-target** installed and working.

### Steps

1. **Download the script**:
   - Clone this repository or download the ZIP and extract it into your **resources** folder.
   ```bash
   git clone https://github.com/Thexiss/txs-elevator.git
   ```

2. **Add the script to your server config**:
   - Open your `server.cfg` and add the following line to ensure the script is loaded:
   ```bash
   ensure txs-elevator
   ```

3. **Dependencies**:
   - Ensure **qb-target** is installed and working on your server as the elevator zones use this for interaction.

4. **Configure the elevators**:
   - Open `config.lua` and customize the elevators as per your server's map setup. Here is an example of adding an elevator:
   ```lua
   Config.Elevators = {
       ["hospital_elevator"] = {
           label = "Hospital",
           targetLabel = "Elevator",
           floors = {
               [1] = {coords = vector4(359.92, -585.01, 28.82, 253.05), targetCoords = vector4(359.91, -583.99, 28.82, 13.99)},
               [2] = {coords = vector4(339.82, -584.55, 74.17, 241.59), targetCoords = vector4(338.53, -584.04, 74.17, 63.23)},
           }
       }
   }
   ```

## Usage

### Add a New Elevator via Config
To add a new elevator manually through the config, follow these steps:

1. Open the `config.lua` file.
2. Add a new elevator configuration using the following format:
   ```lua
   ["elevator_name"] = {
       label = "Elevator Label",
       targetLabel = "Elevator Target",
       floors = {
           [1] = {coords = vector4(0, 0, 0, 0), targetCoords = vector4(0, 0, 0, 0)},
           [2] = {coords = vector4(0, 0, 0, 0), targetCoords = vector4(0, 0, 0, 0)},
           [3] = {coords = vector4(0, 0, 0, 0), targetCoords = vector4(0, 0, 0, 0)},
           -- Add more floors as needed
       }
   }
   ```

3. Customize the **coordinates** for each floor as per your map's layout.

### Dynamically Add a New Elevator via Export
To dynamically add a new elevator from another script, use the provided **export**. This is particularly useful if you want to add elevators programmatically at runtime without modifying the config file.

#### Example:
```lua
exports['qb-elevator']:AddElevator('police_station_elevator', {
    label = "LSPD",
    targetLabel = "LSPD Elevator",
    floors = {
        [1] = {coords = vector4(441.20, -982.50, 30.69, 43.52), targetCoords = vector4(441.20, -982.50, 30.69, 43.52)},
        [2] = {coords = vector4(441.20, -982.50, 30.69, 43.52), targetCoords = vector4(441.20, -982.50, 30.69, 43.52)},
        [3] = {coords = vector4(441.20, -982.50, 30.69, 43.52), targetCoords = vector4(441.20, -982.50, 30.69, 43.52)},
    }
})
```

### Floor Highlighting
When a player opens the elevator UI, the floor they are currently on will be automatically detected and highlighted in the UI, making it easy to see their current location.

### How to Use
- Players can interact with the elevator using the **qb-target** prompt.
- Use the **ESC** key to close the elevator menu.

---

This update now includes the dynamic **export** functionality, allowing you to add elevators programmatically! 🚀

## Key Bindings

- **Interact** with the elevator using `qb-target`.
- **Close the menu** with the `ESC` key.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
