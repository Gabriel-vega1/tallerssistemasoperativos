#!/usr/bin/env python3
import os
import warnings  # Carga la clase catch_warnings usada por el reto.

FLAG = os.environ.get("FLAG", "flag{demo_local}")

def main():
    print("=== Tiny Python Jail ===")
    print("Introduce una expresión para encontrar la bandera.")
    try:
        expression = input("> ")
    except EOFError:
        return
    if not expression.strip() or len(expression) > 500:
        print("Entrada vacía o demasiado larga.")
        return
    try:
        result = eval(expression, {"__builtins__": {}}, {})
        if result is not None:
            print(result)
    except Exception as exc:
        print(f"Error: {type(exc).__name__}: {exc}")

if __name__ == "__main__":
    main()
