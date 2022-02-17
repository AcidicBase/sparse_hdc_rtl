alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

dimensions = input("Dimensionality of HV? ")
dimensions = int(dimensions)
text_file = open("script_output.txt","w")
print("Hypervectors of n = ",dimensions)
mode = input("Select mode of operation (reset or class): ")
if mode == "reset":
    print("Reset generation chosen")
    print("\n", file=text_file)
    for x in alphabet:
        print(f"\t\t\tnb_{x} = {dimensions*8}'d0;", file=text_file)
    print("\n", file=text_file)
    for x in alphabet:
        print(f"\t\t\t{x} <= {dimensions}'d0;", file=text_file)
elif mode == "class":
    print("class generation chosen")
    threshold = input("Threshold value?")
    threshold = int(threshold)
    print("\n\\\\NONBINARY UPDATE (put this in case() in the clocked block\n", file=text_file)
    for x in alphabet:
        print(f"\t\t\t\t5'd{alphabet.index(x)}: begin \\\\{x}", file=text_file)
        for y in range(dimensions):
            print(f"\t\t\t\t\tnb_{x}[{(y+1)*8 - 1}:{y*8}] = nb_{x}[{(y+1)*8 - 1}:{y*8}] + {{7'b0000000,hypervector[{y}]}};", file=text_file)
        print("\t\t\t\tend", file=text_file)
        print("\n", file=text_file)
    print("\t\t\t\t\tdefault: begin", file=text_file)
    print("\n", file=text_file)
    print("\t\t\t\t\tend", file=text_file)
    print("\n\\\\BINARY UPDATE (put this in case() in the always block\n", file=text_file)
    for x in alphabet:
        print(f"\t\t\t\t5'd{alphabet.index(x)}: begin \\\\{x}", file=text_file)
        for y in range(dimensions):
            print(f"\t\t\t\t\tif(nb_{x}[{(y+1)*8 - 1}:{y*8}] >= 8'd{threshold}) begin", file=text_file)
            print(f"\t\t\t\t\t\t{x}[{y}] <= 1'b1;", file=text_file)
            print("\t\t\t\t\tend", file=text_file)
            print("\t\t\t\t\telse begin", file=text_file)
            print(f"\t\t\t\t\t\t{x}[{y}] <= 1'b0;", file=text_file)
            print("\t\t\t\t\tend", file=text_file)
        print("\t\t\t\tend", file=text_file)
        print("\n", file=text_file)
    print("\t\t\t\t\tdefault: begin", file=text_file)
    print("\n", file=text_file)
    print("\t\t\t\t\tend", file=text_file)
text_file.close()