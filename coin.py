import random
print("Сейчас программа 'подбросит' монетку и подсчитает сколько раз выпадет")
print("'решка', или 'орел'.")
 
reshka = 0
orel = 0
kol_podbros = 0

 
while kol_podbros < 1000:
	kol_podbros += 1
	podbros = random.randint(1, 2)
	if podbros == 1:
		orel += 1
	if podbros == 2:
		reshka += 1

 
print("\nОрлов выпало: ", orel)
print("Решек выпало: ", reshka)
print("Количество подбросов: ", kol_podbros)
