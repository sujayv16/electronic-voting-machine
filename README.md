# Electronic Voting Machine (EVM) using PYNQ-Z2

This project implements an Electronic Voting Machine (EVM) using the PYNQ-Z2 board and a breadboard. The system allows users to cast votes for three different parties, with an invalid vote indicator and vote tally display.

## Introduction

This project aims to create a functional electronic voting machine using the PYNQ-Z2 board. It provides a platform where users can simulate voting for three parties, with the system counting votes and displaying results on LEDs.

## Features

- **Voting Interface**: Users can press buttons to simulate votes for three different parties.
- **Vote Counting**: Votes are counted in real-time and displayed using LEDs.
- **Invalid Vote Detection**: The system detects and indicates invalid votes.
- **Button Debouncing**: Implemented to ensure accurate vote counting with reliable button presses.

## Components Required

To replicate this project, you will need the following components:

- **PYNQ-Z2 Board**: Acts as the main controller.
- **Breadboard**: Used to connect buttons and LEDs.
- **Push Buttons**: For simulating voter input.
- **LEDs**: Indicate party votes and invalid vote states.
- **Resistors**: Required for current limiting with LEDs and pull-down resistors for buttons.
- **Jumper Wires**: Connect components on the breadboard to the PYNQ-Z2 board.

## Hardware Setup

1. **Button Connections**:
   - Connect push buttons to GPIO pins on the PYNQ-Z2 board.
   - Ensure each button has a pull-down resistor to ground.

2. **LED Connections**:
   - Connect LEDs to GPIO pins on the PYNQ-Z2 board.
   - Use current-limiting resistors (e.g., 220 ohms) in series with each LED.

## PYNQ-Z2 Configuration

Ensure your PYNQ-Z2 board is correctly configured with Vivado and the required Verilog code is synthesized and uploaded to the board. Verify connections and test functionality before using in a live scenario.

## Usage

1. **Power On**: Ensure the PYNQ-Z2 board is powered correctly.
2. **Button Press**: Press buttons to simulate votes for different parties.
3. **LED Indicators**: LEDs will indicate vote counts for each party and invalid vote states.
4. **Result Display**: Monitor the total votes displayed on the LEDs.
