---
layout: page
title: 03 -- Python intro
---

# Markdown in Jupyter and R

Ustawiając zawartość komórki jako Markdown możesz generować opisy swoich kodów. Język Markdown jest językiem znaczników podobnym do HTML czy Latex. Kod napisany w html i LateX również jest przetwarzany w notatniku, także pisząc w Markdown możesz tak naprawdę posługiwać się wszystkimi tymi językami. Specyfikację oraz info możesz znaleźć [tutaj](http://daringfireball.net/projects/markdown/).

Ściągnij [Plik](notebooks/Markdown.ipynb) i otwórz go.

Komórkę w notatniku uruchamiamy wciskając _Shift+Enter_.

# Python Basics

Za uruchomienie danego języka programowania odpowiada tzw. Kernel, kóry jest uruchamiany automatycznie po uruchomieniu pierwszej komórki.

```python
a = 10
print(a)
```

> Python rozróżnia wielkość liter (ang. _case sensitive_).

Notatnik działa jak konsola, także aby uruchomić polecenia konsolowe nie musisz przechodzić do terminala

```python
!pwd # Mac, Linux
!ls # Mac, Linux
!dir # dla windowsa
# co ciekawe bash i pythona można łączyć
message = "Hello World!"
!echo $message
```

Korzystać również można z automatycznego uzupełniania po wciśnięciu _tab_:

```python
import numpy
numpy.random.  #use tab
```

Zgłaszane są również wszystkie wyjątki:

```python
x = 1
y = 4
z = y/(1-x)
```

W Jupyterze masz dostęp do wielu komend _magicznych_.

```python
%load?
%matplotlib inline
%timeit
```

Gdybyś szybko potrzebował coś zapisać do pliku:

```python
%%file data.csv
Date,Open,High,Low,Close,Volume,Adj Close
2012-06-01,569.16,590.00,548.50,584.00,14077000,581.50
2012-05-01,584.90,596.76,522.18,577.73,18827900,575.26
2012-04-02,601.83,644.00,555.00,583.98,28759100,581.48
2012-03-01,548.17,621.45,516.22,599.55,26486000,596.99
2012-02-01,458.41,547.61,453.98,542.44,22001000,540.12
2012-01-03,409.40,458.24,409.00,456.48,12949100,454.53
```

A teraz LateX

```python
%%latex
\begin{aligned}
\nabla \times \vec{\mathbf{B}} -\, \frac1c\, \frac{\partial\vec{\mathbf{E}}}{\partial t} & = \frac{4\pi}{c}\vec{\mathbf{j}} \\
\nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\
\nabla \times \vec{\mathbf{E}}\, +\, \frac1c\, \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\
\nabla \cdot \vec{\mathbf{B}} & = 0
\end{aligned}

# lub
from IPython.display import Latex
Latex(r"""\begin{eqnarray}
\nabla \times \vec{\mathbf{B}} -\, \frac1c\, \frac{\partial\vec{\mathbf{E}}}{\partial t} & = \frac{4\pi}{c}\vec{\mathbf{j}} \\
\nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\
\nabla \times \vec{\mathbf{E}}\, +\, \frac1c\, \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\
\nabla \cdot \vec{\mathbf{B}} & = 0
\end{eqnarray}""")
# a może tak
from IPython.display import Math
Math(r'F(k) = \int_{-\infty}^{\infty} f(x) e^{2\pi i k} dx')
```

## Wcięcia

Wcięcia w pythonie są bardzo istotne, za to brak nawiasów klamrowych określających bloki kodu.

```python
listOfNumbers = [1, 2, 3, 4, 5, 6]
for number in listOfNumbers:
    print(number)
    if (number % 2 == 0):
        print("is even")
    else:
        print("is odd")
print ("All done.")
```

## Operacje na liczbach

Python obsługuje wszystkie podstawowe **typy skalarne**: _liczby całkowite_, _liczby zmiennoprzecinkowe_, _stałe logiczne_ (True, False). Pamiętaj, iż w pythonie wszystkie typy to obiekty !

```python
1 + 1
2 * 3
1 / 2
2 ** 4
4 % 2
5 % 2
```

## Przypisawanie zmiennych

Zmienne przechowujące dowolne wartości do których możemy odwoływać się podając nazwę zmiennej, tworzymy używając operatora przypisania $=$.

```python
nazwa_zmiennej = 2
x = 3
y = 5
z = x+y
z
napis = "to jest tekst"
napis2 = 'a to inny tekst'
napis
napis2
print(napis)
print(napis,napis2)
num = 12
name = 'Sam'
print('My number is: {one}, and my name is: {two}'.format(one=num,two=name))

print('My number is: {}, and my name is: {}'.format(num,name))
```

## Moduły

```python
import numpy as np

A = np.random.normal(25.0, 5.0, 10)
print (A)
```

## Listy

```python
x = [1, 2, 3, 4, 5, 6]
print(len(x))
['hi',1,[1,2]]
nest = [1,2,3,[4,5,['target']]]
nest[3][2][0]

# indeksowanie
# pierwsze 3 elementy 0:3
x[:3]
# od trzeciego do końca 3:end
x[3:]
# dwa ostatnie 
x[-2:]
# rozszerzanie listy 
x.extend([7,8])
x

x.append(9)
x
# listy list
y = [10, 11, 12]
listOfLists = [x, y]
listOfLists
y[1]
# sortowanie
z = [3, 2, 1]
z.sort()
z

z.sort(reverse=True)
z
```

## Tuple, Krotki

```python
# Tuples are just immutable lists. Use () instead of []
x = (1, 2, 3)
len(x)
y = (4, 5, 6)
y[2]
listOfTuples = [x, y]
listOfTuples
(age, income) = "32,120000".split(',')
print(age)
print(income)
# You can use also
x = 1, 2, 4
print(x)
# try this
x[1] = -2
```

## Sets

```python
{1,2,3}
{1,2,3,1,2,1,2,3,3,3,3,2,2,2,1,1,2}
```

## Słowniki

```python
d = {'key1':'item1','key2':'item2'}
d['key1']
# Like a map or hash table in other languages
captains = {}
captains["Enterprise"] = "Kirk"
captains["Enterprise D"] = "Picard"
captains["Deep Space Nine"] = "Sisko"
captains["Voyager"] = "Janeway"

print(captains["Voyager"])

# metoda get
print(captains.get("Enterprise"))
print(captains.get("NX-01"))

# pętla po elementach
for ship in captains:
    print(ship + ": " + captains[ship])
```

## Flow, instrukcje warunkowe

```python
if 1 < 2:
    print('yep!')

if 1 < 2:
    print('first')
else:
    print('last')

if 1 == 2:
    print('first')
elif 3 == 3:
    print('middle')
else:
    print('Last')
```

## Pętle

```python
for x in range(10):
    print(x)

for x in range(10):
    if (x is 1):
        continue
    if (x > 5):
        break
    print(x) 

x = 0
while (x < 10):
    print(x)
    x += 1

seq = [1,2,3,4,5]
for item in seq:
    print(item)
```

## Funkcje

```python
def SquareIt(x):
    return x * x

print(SquareIt(2))

#You can pass functions around as parameters
def DoSomething(f, x):
    return f(x)

print(DoSomething(SquareIt, 3))

#Lambda functions let you inline simple functions
print(DoSomething(lambda x: x * x * x, 3))
```

## Operatory porównania i logiczne

```python
1 > 2
print(1 == 3)
print(True or False)
if 1 is 3:
    print("How did that happen?")
elif 1 > 3:
    print("Yikes")
else:
    print("All is well with the world")

(1 > 2) and (2 < 3)
(1 == 2) or (2 == 3) or (4 == 4)
```

## Metody

```python
st = 'hello my name is Sam'
st.lower()
st.upper()
st.split()
tweet = 'Go Sports! #Sports'
tweet.split('#')
d = {'key1': 'item1', 'key2': 'item2'}
d.keys()
d.items()
'x' in [1,2,3]
'x' in ['x','y','z']
```

## Klasy i obiekty

```python
class Test():
    pass

a1 = Test()
b2 = Test()

```

Przykład 1

```python
class Figura():
    '''First class'''
    def __init__(self, x ,y):
        self.x = x
        self.y = y

    def info(self):
        print(self.x, self.y)

    def zmien(self, x, y):
        self.x = x
        self.y = y
    
    def przesun(self, dx, dy):
        self.info()
        self.x, self.y = self.x+dx, self.y + dy
        self.info()

o = Figura(1,-2)
o.info()
o.zmien(2,4)
o.info()                
```

Przykład 2 (Dziedziczenie)

```python
class Okrag(Figura):
    def __init__(self, x, y, r=1):
        super().__init__(x, y)
        self.r = r

    def info(self):
        print(f'x={self.x}, y={self.y}, r={self.r}')


ok = Okrag(0,0,3)
ok.info()
ok.przesun(10,15)           
```

