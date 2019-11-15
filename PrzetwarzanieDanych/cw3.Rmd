---
title: "03 -- Python Modelowanie danych"
---
## Zbiory danych

Odpowiednie przygotowanie danych to $80\%$ czasu pracy nad modelowaniem i wydobywaniem informacji z danych.

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

iris.data zawiera **wartości liczbowe** zmiennych (zgodnie z listą *iris.feature_names*) sepal length, sepal width, petal length, petal width uporządkowane w macierz ($150 \times 4$), gdzie $150$ to liczba obserwacji a $4$ to liczba cech.

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


### Generowanie danych sztucznych

Pakiet scikit-learn umożliwia szybkie wygenerowanie zbiorów danych na potrzeby regresji, klasyfikacji, analizy klastrów czy redukcji liczby wymiarów. Dane generowane są bezpośrednio do pamięci stąd nie trzeba ich pobierać z internetu ani przetrzymywać na dysku.

```python
from sklearn import datasets
%%timeit
X,y = datasets.make_classification(n_samples=10**6, n_features = 10, random_state=1234)
print(X.shape, y.shape)
```

Dzięki zastosowaniu konkretnej wartości random_state uzyskasz te same dane na dowolnym innym komputerze.


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

### Feature engineering

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

```python
# możesz też użyć drzewa decyzyjnego
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
X_train, X_test, y_train, y_test = train_test_split(iris.data, iris.target, train_size=0.7, random_state=1)
dtc = DecisionTreeClassifier()
dtc.fit(X_train, y_train)
dtc.score(X_test, y_test)
```

> **Zadanie** Zaproponuj inne cechy i wygeneruj z nich swoje modele tak by uzyskać jak najlepszy wynik. Rozwiązanie  (możesz użyć Jupyter notebook'a) wyślij jako formę zaliczenia zajęć on-line
