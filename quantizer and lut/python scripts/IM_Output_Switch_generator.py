# Generate Verilog File

f = open("IM_Output_Switch.v", "w+")

dim = 10;

f.write("module IM_Output_Switch(output_id, level_hv, input_hv);\n")
f.write("  input [3:0] output_id;\n")
f.write("  input [{}:0] output_hv;\n".format(dim-1))
f.write("  output reg [616:0][{}:0] level_hv;\n".format(dim-1))

f.write("\n")

f.write("  always@(*) begin\n")

f.write("    case(output_id)\n")
for i in range(0,617):
    f.write("      {} : level_hv[{}][{}:0] = output_hv;\n".format(i, i, dim-1))
f.write("    endcase\n")

f.write("  end\n")

f.write("endmodule\n\n")