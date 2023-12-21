from PIL import Image

name = "image"

out = open(name + ".coe", "w")
img = Image.open(name + ".png")
img = img.convert('RGB')
col, row = img.size

out.write("memory_initialization_radix=16;\n")
out.write("memory_initialization_vector=\n")
i = 0
for y in range(row):
    for x in range(col):
        r, g, b = img.getpixel((x, y))
        r, g, b = r >> 4, g >> 4, b >> 4
        if i == col * row - 1:
            out.write("%x%x%x;" % (r, g, b))
        else:
            out.write("%x%x%x,\n" % (r, g, b))
        i += 1
print(f"Wrote {row * col} pixels to {name}.coe")
