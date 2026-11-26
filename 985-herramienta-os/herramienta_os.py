#!/usr/bin/env python3
"""Menú didáctico para explorar el módulo estándar os."""
import os
import platform
import shutil
from pathlib import Path

def pausa():
    input("\nPulsa Enter para continuar...")

def listar():
    ruta = Path(input("Ruta (vacío = directorio actual): ").strip() or ".").expanduser()
    if not ruta.is_dir():
        print("La ruta no es un directorio.")
        return
    for item in sorted(ruta.iterdir(), key=lambda p: p.name.lower()):
        tipo = "DIR " if item.is_dir() else "FILE"
        print(f"{tipo:4} {item.name}")

def metadatos():
    ruta = Path(input("Ruta del archivo: ").strip()).expanduser()
    try:
        info = ruta.stat()
        print(f"Nombre: {ruta.name}\nTamaño: {info.st_size} bytes\nModificado: {info.st_mtime}\nPermisos: {oct(info.st_mode)}")
    except OSError as exc:
        print(f"No se pudo consultar: {exc}")

def crear_carpeta():
    nombre = input("Nombre de la carpeta nueva: ").strip()
    if not nombre or Path(nombre).name != nombre or nombre in {".", ".."}:
        print("Escribe un nombre sencillo, sin rutas.")
        return
    try:
        Path.cwd().joinpath(nombre).mkdir()
        print(f"Carpeta creada: {Path.cwd() / nombre}")
    except FileExistsError:
        print("Ya existe una entrada con ese nombre.")
    except OSError as exc:
        print(f"No se pudo crear: {exc}")

def espacio():
    total, usado, libre = shutil.disk_usage(Path.cwd())
    print(f"Total: {total:,} bytes\nUsado: {usado:,} bytes\nLibre: {libre:,} bytes")

def menu():
    opciones = {
        "1": ("Directorio actual", lambda: print(os.getcwd())),
        "2": ("Listar directorio", listar),
        "3": ("Metadatos de archivo", metadatos),
        "4": ("Crear carpeta", crear_carpeta),
        "5": ("Variables de entorno", lambda: [print(f"{k}={v}") for k, v in sorted(os.environ.items())]),
        "6": ("Información del sistema", lambda: print(f"SO: {platform.system()} {platform.release()}\nPython: {platform.python_version()}\nArquitectura: {platform.machine()}")),
        "7": ("Espacio en disco", espacio),
    }
    while True:
        print("\n=== Explorador del módulo os ===")
        for key, (label, _) in opciones.items(): print(f"{key}. {label}")
        print("0. Salir")
        choice = input("Opción: ").strip()
        if choice == "0": break
        if choice not in opciones:
            print("Opción no válida.")
            continue
        try: opciones[choice][1]()
        except (OSError, ValueError) as exc: print(f"Operación no disponible: {exc}")
        pausa()

if __name__ == "__main__":
    menu()
