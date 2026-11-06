# SEU-Tolerant Register System Using Triple Modular Redundancy (TMR)

## Project Overview
This project implements an 8-bit Single Event Upset (SEU)-tolerant register system using Triple Modular Redundancy (TMR) in SystemVerilog.

Three redundant registers store identical data. A majority voter ensures correct output generation even when one register experiences a simulated bit-flip error.

## Objectives
- Design a fault-tolerant register system using TMR.
- Implement three redundant 8-bit registers.
- Simulate SEUs through controlled fault injection.
- Detect register mismatches using an error detection circuit.
- Implement majority voting to maintain correct output.
- Restore corrupted register data through automatic recovery.

## Architecture
The system consists of:
- Three redundant 8-bit registers (R1, R2, R3).
- Majority voting circuit.
- Error detection logic.
- Fault injection mechanism.
- Recovery logic.

## Working Principle

1. **Data Storage:** Three redundant 8-bit registers store identical copies of the input data.
2. **Fault Injection:** A simulated SEU is introduced by flipping bit 3 of register R2 using a fault control signal.
3. **Error Detection:** A comparison circuit detects mismatches between the three registers.
4. **Majority Voting:** A 2-out-of-3 majority voter generates the correct output despite a single-register bit error.
5. **Fault Recovery:** The majority-voted output is written back into all three registers to restore the original data.
6. **Verification:** The design is implemented using SystemVerilog and verified through simulation on EDA Playground.

## Tools and Technologies
- Language: SystemVerilog
- Simulation Platform: EDA Playground
- Waveform Viewer: EPWave

## Simulation Results
Fault injection was tested individually in all three registers.

The system successfully detected the injected faults, maintained the correct majority-voted output and restored the register contents.

## Limitations
The design tolerates faults in one redundant register, assuming the other two registers remain correct.

## Future Enhancements
- Multiple-bit fault injection.
- Fault counter implementation.
- Recovery status monitoring.
- Testing simultaneous faults.

## Author
Developed as a VLSI/RTL design project.