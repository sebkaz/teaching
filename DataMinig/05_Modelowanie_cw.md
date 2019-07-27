---
layout: page
title: 05 -- Analiza danych
mathjax: true
---

## Zbiory danych

Odpowiednie przygotowanie danych to $80%$ czasu pracy nad modelowaniem i wydobywaniem informacji z danych.

### Przykładowe zbiory danych z pakietu scikit-learn

W pakiecie [scikit-learn](http://scikit-learn.org/stable/datasets/index.html) znajduje się moduł z prostymi przykładowymi zbiorami danych. Można je łatwo zaimportować w Pythonie za pomocą instrukcji import. Zbiory te to np. Iris, Boston itp. Są to najczęściej wymieniane zbiory w wielu publikacjach, książkach i kursach.

Zbiory te mają postać obiektów (słowników w Pythonie) i oprócz cech, zmiennych docelowych obejmują kompletny opis oraz objaśnienie kontekstu danych.

Zaczniemy od zbioru **IRIS**.

```python
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
%matplotlib inline


from sklearn import datasets
iris = datasets.load_iris()
```

Wszystkie zbiory z pakietu scikit-learn udostępniają następujące pola:

```python
print(iris.DESCR) # opis danych
print(iris.data)  # features, cechy
print(type(iris.data)) # tablica NumPy ndarray
print(iris.data.shape) # rozmiar tablicy zwraca tuple
print(iris.feature_names) # lista nazw dla iris.data
print(iris.target)  # zmienna celu (target)
print(iris.target.dtype) # tablica NumPy
print(iris.target.shape) # rozmiary tablicy celu
```

> **Zadanie** Wczytaj dane Iris 

główne struktury danych z obiektu _iris_ to _data_ i _target_.

iris.data zawiera **wartości liczbowe** zmiennych (zgodnie z listą *iris.feature_names*) sepal length, sepal width, petal length, petal width uporządkowane w macierz ($150 \times 4$), gdzie 150 to liczba obserwacji a 4 to liczba cech.

iris.target zawiera wektor wartości całkowitoliczbowych reprezentujących odpowiednie klasy (zgodnie z *iris.target_names*).

Zbiór ten często wykorzystuje się ze względu na łatwość wczytania, obsługi i eksploracji do nauczania nadzorowanego, nienadzorowanego czy graficznej prezentacji danych. Modele na tych danych tworzy się bardzo szybko.

```python
colors = []
palette = {0:"red", 1:"green", 2:"blue"}
for c in np.nditer(iris.target):
    colors.append(palette[int(c)])
df = pd.DataFrame(iris.data, columns=iris.feature_names)
sc = pd.plotting.scatter_matrix(df, alpha=0.3, figsize=(10,10), diagonal="hist", color=colors, marker="o", grid="True")
```

Mimo, iż zbiory te są bardzo przydatne w trakcie nauki bardzo często będziesz musiał zajmować się złożonymi i rzeczywistymi danymi. Stąd potrzebna będzie nam wiedza jak wczytywać dane zewnętrzne.


## Dane z witryn internetowych - format LIBSVM


[LIBSVM Data](Libsvm) to witryna, na której znajduje się wiele różnych kolekcji danych. Dane te zapisane są w formacie LIBSVM. Wczytanie danych odbywa się za pośrednictwem połączenia ze stroną:

```python
from urllib.request import urlopen
target_page = 'http://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/binary/a1a'
result = urlopen(target_page)
from sklearn.datasets import load_svmlight_file
X, y = load_svmlight_file(result)
print(X.shape, y.shape)
```

Mając unixowy system operacyjny możesz pobrać dane z repozytorium bezpośrednio na dysk z użyciem narzędzia *wget*.

### Wczytywanie danych bezpośrednio z plików

Jeżeli dane nad którymi chcesz pracować masz już na swoim komputerze w postaci pliku tekstowego np. _*.csv_ to możesz wczytać ten zbiór na dwa sposoby:

1. funkcja *loadtxt* z pakietu NumPy,
2. funkcja *read_csv* z biblioteki Pandas.

Przykładowy plik możesz znaleźć [tutaj](data/bike1.csv).


Umieść plik gdzieś na swoim dysku, tak by łatwo można było go znaleźć.

Ponieważ wszystkie dane zawarte w pliku csv (w naszym przypadku) są typu numerycznego można posłużyć się pierwszą metodą oraz wczytać wszystko do tablicy NumPy. Ale pamiętaj, że wtedy musisz używać metod (funckji) związanych z tą biblioteką. Metoda ta jest najszybsza i zabiera najmniej pamięci.

```python
housing = np.loadtxt('bike1.csv')
# Bądź z wersji sieciowej 
# housing = np.loadtxt('https://sebkaz.github.io/DataMining/data/bike1.csv')
```
#### dlaczego to nie działa ?

Funkcja loadtext przyjmuje, że dane są oddzielone tabulacją. Stąd jeżeli w pliku tak nie jest dodaj ustawienie *delimiter=*. W naszym przypadku dane oddzielone są przecinkiem ','.

```python
bikes = np.loadtxt('bike1.csv', delimiter=';')
print(bikes.shape)
```
Zdarza się, że w plikach csv zawarta jest również informacja o nagłówkach. Tablica NumPy nie może zawierać napisów jeśli pozostała część danych to liczby. Aby w takiej sytuacji wczytać dane należy parametrem `skiprows=1` zaznaczyć od którego wiersza mają być wczytywane dane (pamiętaj, że w pythonie pierwszy element  w tablicach ma indeks 0).

```python
bikes = np.loadtxt('bike1.csv', delimiter=';', skiprows=1)
```

W rzeczywistości dane zawierają zazwyczaj zmienne kategoryjne. Spróbuj załadować dane Iris ze [strony](https://archive.ics.uci.edu/ml/machine-learning-databases/iris/). Ponieważ w zbiorze tym zmienna _class_ zawiera łańcuchy znaków określających gatunek irysa stąd metoda loadtxt okaże się nieodpowiednia.

W sytuacji tej rozwiązanie zapewnia biblioteka `Pandas`, udostępniająca strukturę danych **DataFrame**, która obsługuje zmienne różnego typu.

> **Zadanie** Zapisz plik iris i wczytaj go do ramki danych.

```python
# plik nie ma nagłówków więc musimy dodać je sami
nazwy =['sepal_length','sepal_width','petal_length','petal_width','target']
# pomocna zmienna
iris_filename = 'iris.data'
iris = pd.read_csv(iris_filename, sep=',', decimal='.', header=None, names=nazwy)
# zobaczmy co otrzymaliśmy
print(type(iris))
```

Ścieżka do pliku może pochodzić z zewnętrznego serwera.

```python
import pandas as pd
file = 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
df = pd.read_csv(file, header=None, sep=',', decimal='.')
```

Po nazwie pliku podaliśmy separator _sep = ','_ ,  znak oddzielający część dziesiętną _decimal_, poinformowaliśmy, że w danych nie ma nagłówków, oraz dodaliśmy swoje nazwy kolumn (inaczej zastosowane zostałyby nazwy domyślne).

Oczywiście można przekształcić DataFrame do tablic NumPy.

```python
# wpierw wybierzmy tylko kolumny z danymi numerycznymi
lista_column = ['sepal_length','sepal_width','petal_length','petal_width']
# tutaj dodajmy nową zmienną
iris2 = iris[lista_column]
iris_data = iris2.values
# a teraz target
iris_target, iris_target_name = pd.factorize(iris['target'])
print(iris_data.shape, iris_target.shape)
```


### Generowanie danych sztucznych

Pakiet scikit-learn umożliwia szybkie wygenerowanie zbiorów danych na potrzeby regresji, klasyfikacji, analizy klastrów czy redukcji liczby wymiarów. Dane generowane są bezpośrednio do pamięci stąd nie trzeba ich pobierać z internetu ani przetrzymywać na dysku.

```python
from sklearn import datasets
%%timeit
X,y = datasets.make_classification(n_samples=10**6, n_features = 10, random_state=1234)
print(X.shape, y.shape)
```

Dzięki zastosowaniu konkretnej wartości random_state uzyskasz te same dane na dowolnym innym komputerze.


## Pliki Excela

W analogii do plików csv zobaczmy czy uda się załadować [plik excela](data/Excel_Sample.xlsx).

```python
df = pd.read_excel('Excel_Sample.xlsx', na_values = 'n/a')
df.info()
```

Nasz plik składa się jednak z dwóch arkuszy. Jako, że nie ma żadnego ustawienia w naszym kodzie padnas wczytał pierwszy arkusz. Aby samemu zadecydować, który arkusz chcemy musimy dodać opcję _sheetname_.

```python
df = pd.read_excel('Excel_Sample.xlsx', na_values = 'n/a', sheetname='testowy')
df.info()
```

A co jeśli dodam listę nazw arkuszy ?

```python
df = pd.read_excel('Excel_Sample.xlsx', na_values = 'n/a', sheetname=['testowy','testowy2'])
df.info()
```

> Collections.OrderedDict has no attribute 'info'

Skoro to słownik to może trzeba użyć jego klucza ?

```python
df['testowy'].info()
```

Najlepszym sposobem na wczytywanie danych z Excela jest wykorzystanie obiektu _ExcelFile()_.

```python
xls = pd.ExcelFile('Excel_Sample.xlsx')
slownik = xls.sheet_names
print(slownik)
example = pd.read_excel(xls, sheetname=slownik[2], na_values='n/a')
example.info()
```

## Sprawdzamy dane

Załaduj wszystkie biblioteki:

```python
import pandas as pd

#models
from sklearn.dummy import DummyClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier

#success metric
from sklearn.metrics import accuracy_score 

import matplotlib.pyplot as plt
%matplotlib inline
```

Ściągnij i wczytaj [dane](data/polish_names.csv).

```python
df = pd.read_csv("polish_names.csv")
```

Na początek chcemy poznać jakie dane mamy do dyspozycji:
1. Ile jest wierszy (wszystkich obiektów)?
2. Ile jest kolumn (cechy obiektów)?
3. Czy są braki w danych?
4. Która zmienna jest zmienną docelową (*target variable*)?
5. Jaki problem jest do rozwiązania (klasyfikacja czy regresja)?
6. W przypadku klasyfikacji, jakie unikalne wartości ma zmienna docelowa (dwie czy więcej)?
7. Jak wygląda rozkład unikalnych wartości (czy jest mniej więcej po równo, czy jednak są bardzo popularne/rzadkie klasy)?

```python
df.info()
```

1. Druga linia "mówi": `1705 entries`, to jest ilość wierszy (obiektów).
2. Trzecia linia "mówi": `total 2 columns`, co oznacza że mamy 2 kolumny (cechy).
3. Następnie mamy informację o każdej kolumnie i ilość wartości (`non-null`), w tym przypadku nie ma brakujących danych. 
4. Zmienną docelową (en. `target variable`) jest kolumna `gender`


```python
df.gender.value_counts()
```

5. W tym przypadku problemem jest klasyfikacja (skończona liczba w odpowiedzi)
6. Klasyfikacja binarna (odpowiedź ma stwierdzić, czy imię jest męskie czy żeńskie)
7. 1033 męskich imion oraz 672 żeńskich


### Jak wyglądają dane?
Zobacz pierwszych 10 wierszy (używając funkcję `head`). Parametr 10 oznacza ile wierszy chcesz wyświetlić. Jeśli nie podasz tego parametru, to będzie domyślny (spróbuj samo `df.head()`).

```python
df.head(10)
```

Możesz użyć funkcji `sample()`, która działa podobnie do `head()`, jedynie zamiast pobierać wiersze z początku listy, losuje je. Dzięki czemu, jeśli odpalisz kilka razy, to możesz zobaczyć więcej przykładów.

```python
df.sample(10)
```

- Kolumna `name` zawiera imię i czasem są dość ciekawe :).
- Kolumna `gender` zawiera płeć, gdzie `m` oznacza **męskie imię**, a `f` - **żeńskie imię**

Sprawdźmy, jaki jest rozkład męskich i żeńskich imion.

```python
df['gender'].value_counts()
```

- Męskich imion jest prawie 2 razy więcej (1033 do 672). 

Model oczekuje na reprezentację liczbową zamiast słowną. Dlatego teraz musimy to przekształcić: 
* 'f' => 0
* 'm' => 1

Do tego użyjemy funkcji `.map()`.

```python
def transform_string_into_number(string):
    return int(string == 'm')
    
df['gender'].head().map( transform_string_into_number )
```

Zapiszmy wynik działania funckji do nowej zmiennej `target`.
Tym razem do otrzymania wyniku użyjemy wyrażenia lambda.

```python
df['target'] = df['gender'].map(lambda x: int(x == 'm'))
df.head(10)
```

### Feature enginneering

Załóżmy, że cechą na podstawie której będziemy chcieli wyznaczyć czy imię jest męskie czy żeńskie będzie długość imienia.

> **Zadanie** Stwórz zmienną (kolumnę), która będzie przechowywać informację o długości imienia.


```python 
df['len_name'] = df['name'].map(lambda x: len(x))
```

## Twój pierwszy model 

Nie wnikając na razie w same modele nauczmy się jak w bibliotece `sklearn` tworzy się modele. 

```python
# tablica zmiennych na podstawie których chcemy przeprowadzić analizę
X = df[ ['len_name'] ].values
# wyniki dla uczenia z nadzorem
y = df['target'].values
# wybierz model 
model = DummyClassifier()
# dopasuj model do danych
model.fit(X, y)
# stwórz tablicę z predykcjami  
y_pred = model.predict(X)
# zobacz ile predykcji model dobrze oznaczył
accuracy_score(y, y_pred)
```

Problem klasyfikacji można opisywać liniowym modelem Regresji Logistycznej. 


```python
# tablica zmiennych na podstawie których chcemy przeprowadzić analizę
X = df[ ['len_name'] ].values
# wyniki dla uczenia z nadzorem
y = df['target'].values
# wybierz model 
model = LogisticRegression()
# dopasuj model do danych
model.fit(X, y)
# stwórz tablicę z predykcjami  
y_pred = model.predict(X)
# zobacz ile predykcji model dobrze oznaczył
accuracy_score(y, y_pred)
```

> **Zadanie** Znajdź inne cechy i wygeneruj z nich swoje modele. 





[MLdata]:http://mldata.io
[Pascal]:https://www.k4all.org/project/25/
[Libsvm]:http://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/