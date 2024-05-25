import random

def generate(sizeX, sizeY):
	memX = [random.randint(1, 100) for _ in range(sizeX)]
	memY = [random.randint(1, 100) for _ in range(sizeY)]
	with open("memX.txt", "w") as archivo:
	    for val in memX:
	        val_hex = hex(val)[2:]
	        archivo.write(val_hex + '\n')
	print("Se ha generado el archivo de la memoria X")
	with open("memY.txt", "w") as archivo:
	    for val in memY:
	        val_hex = hex(val)[2:]
	        archivo.write(val_hex + '\n')
	print("Se ha generado el archivo de la memoria Y")
generate(10,5)
