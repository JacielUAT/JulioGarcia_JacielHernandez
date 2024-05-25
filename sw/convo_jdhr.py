import numpy as np
import math
def convolucion(x,y,shape):
    n = len(x) #Obtenemos el tamaño del dataX
    m = len(y) #Obtenemos el tamaño del datay
    z = []
    z = np.zeros(n+m-1) #Generarmos dataZ del tamaño del dataX+dataY-1
    inicio = 0
    #k tomará los valores desde 0 hasta el total de iteraciones de la convolucion,
    # que es n+m-1
    for k in range(n+m-1):
        if(shape ==1 and (k<(math.floor((n-1)/2)-1) or (k > (math.floor(((n-1)/2)-1)+n-1)))): #((k< (((n-1)/2)-1)) or (k>(((n -1)/2)+ n-1)))):
            continue
        #Se calcula el valor de los indices que se usarán para seleccionar la información de dataX y dataY para las 
        #multiplicaciones y sumas entre dataX y dataY 
        #La variable inicio tomará solo tomará el valor de 0 hasta que k sea mayor a m, posterio a esto la
        #la variable inicio irá incrmentando de 1 en 1 hasta que k llege a n+m-1 
        inicio = max(0, k - m + 1)     
        #Se calcula el valor de los hasta donde llegará las mutplicaciones y sumas entre dataX y dataY
        #la variable fin tomará al inicio solo valores que va tomando la variable k, cuando k se mayor a n, 
        #la variable fin tomará siempre el valor de n-1
        fin = min(k, n-1)
        print("Inicio: ",inicio)
        print("Fin: ",fin)
        print("Rango: ")
        print(list(range(inicio,fin+1)))
        for j in range(inicio,fin+1):
            print("Indice: ", j," Indice: ",k-j)
            #Se realiza la sumatoria para cada una de las iteraciones de la convolución
            #guardando la summatoria en las posición dataZ[k], donde el índice j toma valores del rango inicio:fin
            #Mientras k-j toma valores de k(el número actual de la interación de la convolucio) -  j que toma valores del rango inicio:fin
            #Lo importante es el índice k-j, ya que con este te ayuda a seleccionar los indices de dataY con base al la iteración de 
            # la convolución actual.            
            z[k]+= (x[j]*y[k-j])

    return z
#dataX = [1, 1, 0, 0, 0,1,1]
#dataY = [1, 1,  1]
dataX = [-1, 2,  3, -2, 0, 1, 2]
dataY = [2, 4, -1, 1]
data_sizeX =  len(dataX)
data_sizeY =  len(dataY)
dataZ =[]
start = 1 # Estado de inicio
shape = 1 # Tipo de convolución
dataZ = convolucion(dataX,dataY,shape)
print("Convolución")
print(dataZ)

    