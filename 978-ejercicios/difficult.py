try:
    values = list(map(int, input("Enteros separados por espacios: ").split()))
    target = int(input("Objetivo: "))
except ValueError:
    print("Entrada no válida: escribe enteros.")
else:
    seen = {}
    answer = None
    for index, value in enumerate(values):
        complement = target - value
        if complement in seen:
            answer = (seen[complement], index)
            break
        seen.setdefault(value, index)
    if answer is None:
        print("No existe una pareja.")
    else:
        print(f"Índices: {answer[0]}, {answer[1]}")
