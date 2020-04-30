# Gray_Code_Core
 
This Gray code project includes the following files:
* Package file containing functions to convert from Binary to Gray Code, and from Gray Code to Binary.
* VHDL entities that instantiate these functions, mostly for testing.
* VHDL file for a Gray Code counter, this uses a binary counter that is converted to Gray Code on the output.
* VHDL file for a Gray Code adder, this takes 2 Gray Code values, converts them to unsigned binary, adds them, and converts the result to Gray Code on the output.