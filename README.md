**FIFO Sync Module - Verilog Implementation**

This repository contains a Verilog implementation of a Synchronous FIFO (First-In-First-Out) memory along with a corresponding testbench for simulation.


**Table of _Contents_**

1.Introduction

2.Features



3.Installation

4.Usage

5.Simulation

6.Author


**Introduction**

The Synchronous FIFO module is designed to buffer data in a first-in, first-out order. It operates on a synchronous clock, ensuring that both reading and writing occur in sync with the clock edges. This project includes:


A Verilog FIFO module.

A Verilog testbench to simulate and verify the FIFO’s functionality.

**Features**

Parameterizable FIFO depth and data width.

Read and write control signals to manage data flow.

Full and empty flags to indicate the status of the FIFO.

Handles data overflow and underflow conditions.



**Installation**

Requirements:

To work with this project, ensure you have the following tools installed:

ModelSim/QuestaSim or any other Verilog simulator.

Git for version control.

A text editor or IDE such as VS Code, Sublime Text, or Notepad++.

Steps:

Clone the repository:

bash

Copy code

git clone https://github.com/VSDP1357

Navigate to the project directory:

bash

Copy code

cd fifo_sync

Usage:

_FIFO Module:_ The fifo_sync.v file contains the Verilog code for the FIFO implementation. You can modify the parameters like fifo_depth and data_width as needed.


_Testbench:_ The tb_fifo_sync.v testbench is provided to simulate and test the FIFO module. You can run this testbench to validate the design.


**Simulation**

To simulate the FIFO module using ModelSim or QuestaSim, follow the steps below:


Compile the Verilog files:


bash

Copy code

vlog src/fifo_sync.v src/tb_fifo_sync.v

Run the simulation:


Copy code

vsim work.tb_fifo_sync

View the waveforms:


Add signals to the waveform window to analyze.

Run the simulation and observe the data_in, data_out, write, read, full, and empty signals in the waveform viewer.

_**Author**__

_Sai Durga Pradeep Veeramalla_


GitHub: https://github.com/VSDP1357

Linkedin: https://www.linkedin.com/in/sai-durga-pradeep-veeramalla-303224241/
