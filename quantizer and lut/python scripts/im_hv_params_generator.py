o = open("im_hv_assignment.txt", "w+")

for i in range(0, 10):
  f = open("../item_memory/im_hv{}.txt".format(i), "r")
  o.write("im_hvs[{}] = 5000'b{}".format(i, f.readline()))
  o.write(";\n")

o.close()
f.close()
