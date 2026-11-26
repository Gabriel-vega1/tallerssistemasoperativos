text = input("Escribe una frase: ")
vowels = set("aeiouáéíóú")
count = sum(1 for char in text.casefold() if char in vowels)
print(f"Vocales: {count}")
