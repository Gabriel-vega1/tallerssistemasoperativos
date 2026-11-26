raw = input("Enteros separados por espacios: ")
try:
    values = sorted(set(map(int, raw.split())), reverse=True)
    if len(values) < 2:
        print("Se necesitan al menos dos valores distintos.")
    else:
        print(f"Segundo mayor: {values[1]}")
except ValueError:
    print("Entrada no válida: escribe solo enteros.")
