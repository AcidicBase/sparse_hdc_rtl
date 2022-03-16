# sparse_hdc_rtl
For the RTL implementation of sparse HDC for 198/199 

# class_submodule
class_gen.v is incomplete but is a working concept. I just need to copy+paste the output of the assistant script into the appropriate places. No enable signals for the submodule yet. Accompanying testbench is just to test the proof of concept at 10 bits.

# class submodule sequential version:
Small bit-width (50-wide, 5 bits processed per CC). Just a matter of changing bit-widths and expanding adder block for full length
nonbinary register size is still 8 bits per bit
adder hasn't been modified yet to not add when nb_reg > threshold value
threshold value at the moment is 4
confirmed to be working w/ behavioral simulation, not yet confirmed in post-synthesis. And not rigorously tested in behavioral. Should be sufficient to integrate into, though.
Has pipeline support. Previous submodule can change its output as long as 
Needs 1 CC where an input_ready signal is set AND the class and hypervector input is set.
Just in case some desyncing or idling occurs, submodule sends an output signal that signifies that it is ready to receive another input.
