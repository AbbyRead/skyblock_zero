
# Questline: Sensors

Multi-step processes just to craft some logic gates? Aye please!

## Sensor Linker
### ID: qid_sensor_linker

### Text

It be the beginning of the sensor questline; it'll be required fer almost any sensor.

Press **aux1 + any click/tap** with the sensor tool on a sensor to link that tool to the sensor.
Then, ye can **right-click** with the tool on a sensor and set the name of the link (usually "A" or "B").
Ye can **left-click** with the tool on a sensor and automatically use the name ye got from **right-clicking**.
When ye **left-click** a node that be already linked, it'll unlink it.

### Meta

Requires: qid_blast_furnace

## Logic Gates
### ID: qid_logic_gates

### Text

They be machines which turn themselves off or on, dependin' on the states of other machines.  
Ye have to use the sensor linker with logic gates:  
- Ye have to make an "A" link as the 1st input  
- Most of the time ye have to make a "B" link as yer 2nd input  
  
All logic gates run once every 0.25 seconds, this may be referred to as a "switching station subtick".  
  
When ye have multiple logic gates in a chain, there be 2 categories of connections ye can make:  
- "slow" connections - Where each logic gate has to wait 0.25s to execute  
- "fast" connections - Where a sequence of logic gates executes almost instantly  
  
They be dependant on the order that the switching station executes the logic gates.

Switchin' from a fast connection to a slow one or the other way around may involve switchin' the direction the power source or switchin' the way that the logic gates be connected to each other.  
  
Ye can make a computer with these. I would strongly recommend not doin' that. If ye want to do that, submit yer code optimizations to skyblock zero logic gates with a pull request.  
  
Descriptions of each logic gate if ye be unfamiliar with 'em:  
Buffer gate - It'll copy the state of the machine linked in "A", so if it be on, it'll be on, if it be off, it'll be off  
NOT gate - If a machine in link "A" be off, it'll be on, if a machine in link "A" be on, it'll be off  
OR gate - If a machine in link "A" be on, or a machine in link "B" be on, it'll be on, else it'll be off  
AND gate - Both machines in links "A" and "B" have to be on, fer the logic gate to be on  
XOR gate - like the OR gate, but if 2 machines be on, it'll turn off  
XNOR gate - like XOR gate, but passed through a NOT gate  
XOR gate - like OR gate but passed through a NOT gate  
NAND gate - like AND gate but passed through a NOT gate  
  
Ye can complete this quest by craftin' the buffer gate.  

### Meta

Requires: qid_sensor_linker

## Machine Controller
### ID: qid_machine_controller

### Text

It be a machine that sets the state of multiple machines accordin' to another chosen machine.

Ye have to use the sensor linker with machine controllers:

* Link "A" determines the machine whose state should be copied to all the machines in link "B"

Example:
The machine at link "A" be off, so all the machines in link "B" are turned off

### Meta

Requires: qid_sensor_linker

## Delayer
### ID: qid_delayer

### Text

The Delayer be not a machine, but rather a node that turns on after a selected amount of time.
It uses node timers, so it may not work when ye aren't near it (somewhere around 48 nodes away). However, it'll work if it be force-loaded in some way.

### Meta

Requires: qid_sensor_linker

## Light Sensor
### ID: qid_light_sensor

### Text

Finally! A sensor in the "Sensors" questline!

It senses light; dependin' on the condition (see the UI), it'll turn on; otherwise, it'll turn off.

Link "A" determines which position to test.

### Meta

Requires: qid_sensor_linker

## Node Sensor
### ID: qid_node_sensor

### Text

Link "A" determines which node to check.

It'll turn on if the node at link "A" matches what be shown in the UI.

### Meta

Requires: qid_sensor_linker

## Item Sensor
### ID: qid_item_sensor

### Text

Now... this one be a little tricky.

Link "A" should be a pipeworks-compatible storage.
It'll check if it can insert an item into that storage; if aye, it'll turn on.

In most machines, the item count that ye put into this sensor won't matter.

### Meta

Requires: qid_sensor_linker

## Switches
### ID: qid_switches

### Text

They be like connectors, but they don't do anythin' to a power network.
Ye can turn 'em on or off.

### Meta

Requires: qid_sensor_linker
