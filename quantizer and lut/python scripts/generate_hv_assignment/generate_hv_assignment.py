def generate_hv_assignment():
  o = open("im_hv_assignment.txt", "w+")

  for i in range(0, 10):
    f = open("item_memory/im_hv{}.txt".format(i), "r")
    o.write("im_hvs[{}] = 5000'b{}".format(i, f.readline()))
    o.write(";\n")

  o.close()
  f.close()

def generate_sample_hv_assignment(bit_width):
  o = open("sample_hv_assignment.txt", "w+")

  for i in range(0, 10):
    o.write("im_hvs[{}] = ".format(i))
    o.write(format(i, "#0{}b".format(bit_width)).replace("0b", "{}'b".format(bit_width)) )
    o.write(";")
    if i!=9:
      o.write("\n")

generate_sample_hv_assignment(64)
