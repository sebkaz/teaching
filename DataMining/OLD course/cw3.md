title: Wczytywanie danych
slug: dataproc
category: Cwiczenia
date: 2018-03-14
Author: Sebastian Zajac

# Zbiory danych

## UWAGA

Przed wykonaniem poniższych kodów wczytaj bibliotekę pandas, numpy i matplotlib (patrz poprzednie [ćwiczenia 1, Zadanie 2A](https://sebkaz.github.io/posts/2018/lut/23/intro/#zadanie2))

Odpowiednie przygotowanie danych to $80%$ czasu pracy nad modelowaniem i wydobywaniem informacji z danych.

## Przykładowe zbiory danych z pakietu scikit-learn

W pakiecie [scikit-learn](http://scikit-learn.org/stable/datasets/index.html) znajduje się moduł z prostymi przykładowymi zbiorami danych. Można je łatwo zaimportować w Pythonie za pomocą instrukcji import. Zbiory te to np. Iris, Boston itp. Są to najczęściej wymieniane zbiory w wielu publikacjach, książkach i kursach.

Zbiory te mają postać obiektów (słowników w Pythonie) i oprócz cech, zmiennych docelowych obejmują kompletny opis oraz objaśnienie kontekstu danych.

Zaczniemy od zbioru **IRIS**.

```{Python}
from sklearn import datasets
iris = datasets.load_iris()
```

Wszystkie zbiory z pakietu scikit-learn udostępniają metody:

```{Python}
print(iris.DESCR) # opis danych
print(iris.data)  # features, cechy
print(type(iris.data)) # tablica NumPy ndarray
print(iris.data.shape) # rozmiar tablicy zwraca tuple
print(iris.feature_names) # lista nazw dla iris.data
print(iris.target)  # zmienna celu (target)
print(iris.target.dtype) # tablica NumPy
print(iris.target.shape) # rozmiary tablicy celu
```

Główne struktury danych z obiektu _iris_ to _data_ i _target_.

iris.data zawiera **wartości liczbowe** zmiennych (zgodnie z listą *iris.feature_names*) sepal length, sepal width, petal length, petal width uporządkowane w macierz ($150 \times 4$), gdzie 150 to liczba obserwacji a 4 to liczba cech.

iris.target zawiera wektor wartości całkowitoliczbowych reprezentujących odpowiednie klasy (zgodnie z *iris.target_names*).

Zbiór ten często wykorzystuje się ze względu na łatwość wczytania, obsługi i eksploracji do nauczania nadzorowanego, nienadzorowanego czy graficznej prezentacji danych. Modele na tych danych tworzy się bardzo szybko.

```{python}
colors = []
palette = {0:"red", 1:"green", 2:"blue"}
for c in np.nditer(iris.target):
    colors.append(palette[int(c)])
df = pd.DataFrame(iris.data, columns=iris.feature_names)
sc = pd.plotting.scatter_matrix(df, alpha=0.3, figsize=(10,10), diagonal="hist", color=colors, marker="o", grid="True")
```

Mimo, iż zbiory te są bardzo przydatne w trakcie nauki bardzo często będziesz musiał zajmować się złożonymi i rzeczywistymi danymi. Stąd potrzebna będzie nam wiedza jak wczytywać dane zewnętrzne.

## Publiczne repozytoria [MLdata.org](http://mldata.org)

Witryna [MLdata.org](http://mldata.org) udostępnia publiczne repozytorium danych do uczenia maszynowego z uczelni TU Berlin University [projekt PASCAL](http://www.pascal-network.org).

Wszystkie dane dotyczące trzęsień ziemi opublikowane przez United States Geological Survey od 1972 roku dostępne są pod [linkiem](http://mldata.org/repository/data/viewslug/global-earthquakes/).

```{python}
from sklearn.datasets import fetch_mldata
earthquakes = fetch_mldata('global-earthquakes') # sprawdz link do danych.
print(earthquakes.data)
print(earthquakes.data.shape)
```

## Dane z witryn internetowych - format LIBSVM

[LIBSVM Data](http://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/) to witryna, na której znajduje się wiele różnych kolekcji danych. Dane te zapisane są w formacie LIBSVM. Wczytanie danych odbywa się za pośrednictwem połączenia ze stroną:

```{python}
from urllib.request import urlopen
target_page = 'http://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/binary/a1a'
result = urlopen(target_page)
from sklearn.datasets import load_svmlight_file
X, y = load_svmlight_file(result)
print(X.shape, y.shape)
```

Mając unixowy system operacyjny możesz pobrać dane z repozytorium bezpośrednio na dysk z użyciem narzędzia *wget*.

## Wczytywanie danych bezpośrednio z plików

Jeżeli dane nad którymi chcesz pracować masz już na swoim komputerze w postaci pliku tekstowego np. _*.csv_ to możesz wczytać ten zbiór na dwa sposoby:

1. funkcja *loadtxt* z pakietu NumPy,
2. funkcja *read_csv* z biblioteki Pandas.

Przykładowy plik możesz znaleźć [pod adresem](http://mldata.org/repository/data/viewslug/regression-datasets-housing/), bądź [tutaj]({filename}/files/regression-datasets-housing.csv).

Umieść plik gdzieś na swoim dysku, tak by łatwo można było go znaleźć.

Ponieważ wszystkie dane zawarte w pliku csv (w naszym przypadku) są typu numerycznego można posłużyć się pierwszą metodą oraz wczytać wszystko do tablicy NumPy. Ale pamiętaj, że wtedy musisz używać metod (funckji) związanych z tą biblioteką. Metoda ta jest najszybsza i zabiera najmniej pamięci.

```{python}
housing = np.loadtxt('regression-datasets-housing.csv')
```

### dlaczego to nie działa ?

Funkcja loadtext przyjmuje, że dane są oddzielone tabulacją. Stąd jeżeli w pliku tak nie jest dodaj ustawienie *delimiter=*. W naszym przypadku dane oddzielone są przecinkiem ','.

```{python}
housing = np.loadtxt('regression-datasets-housing.csv', delimiter=',')
print(housing.shape)
```

Zdarza się, że w plikach csv zawarta jest również informacja o nagłówkach. Tablica NumPy nie może zawierać napisów jeśli pozostała część danych to liczby. Aby w takiej sytuacji wczytać dane należy parametrem *skip=1* zaznaczyć od którego wiersza mają być wczytywane dane (pamiętaj, że w pythonie pierwszy element  w tablicach ma indeks 0).

W rzeczywistości dane zawierają zazwyczaj zmienne kategoryjne. Spróbuj załadować dane Iris ze [strony](https://archive.ics.uci.edu/ml/machine-learning-databases/iris/). Ponieważ w zbiorze tym zmienna _class_ zawiera łańcuchy znaków określających gatunek irysa stąd metoda loadtxt okaże się nieodpowiednia.

W sytuacji tej rozwiązanie zapewnia biblioteka Pandas, udostępniająca strukturę danych **DataFrame**, która obsługuje zmienne różnego typu.

Zapisz [plik iris]({filename}/files/iris.csv) i wczytaj go do ramki danych.

```{python}
# plik nie ma nagłówków więc musimy dodać je sami
nazwy =['sepal_length','sepal_width','petal_length','petal_width','target']
# pomocna zmienna
iris_filename = 'iris.csv'
iris = pd.read_csv(iris_filename, sep=',', decimal='.', header=None, names=nazwy)
# zobaczmy co otrzymaliśmy
print(type(iris))
```

Ścieżka do pliku może pochodzić z zewnętrznego serwera.

```{python}
import pandas as pd
file = 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
pd.read_csv(file, header=None, decimal='.')
```

Po nazwie pliku podaliśmy separator _sep = ','_ ,  znak oddzielający część dziesiętną _decimal_, poinformowaliśmy, że w danych nie ma nagłówków, oraz dodaliśmy swoje nazwy kolumn (inaczej zastosowane zostałyby nazwy domyślne).

Oczywiście można przekształcić DataFrame do tablic NumPy.

```{python}
# wpierw wybierzmy tylko kolumny z danymi numerycznymi
lista_column = ['sepal_length','sepal_width','petal_length','petal_width']
# tutaj dodajmy nową zmienną
iris2 = iris[lista_column]
iris_data = iris2.values
# a teraz target
iris_target, iris_target_name = pd.factorize(iris['target'])
print(iris_data.shape, iris_target.shape)
```

## Generowanie danych sztucznych

Pakiet scikit-learn umożliwia szybkie wygenerowanie zbiorów danych na potrzeby regresji, klasyfikacji, analizy klastrów czy redukcji liczby wymiarów. Dane generowane są bezpośrednio do pamięci stąd nie trzeba ich pobierać z internetu ani przetrzymywać na dysku.

```{python}
from sklearn import datasets
%%timeit
X,y = datasets.make_classification(n_samples=10**6, n_features = 10, random_state=1234)
print(X.shape, y.shape)
```

Dzięki zastosowaniu konkretnej wartości random_state uzyskasz te same dane na dowolnym innym komputerze.

## Parametry metody read_csv i proste własności DataFrame

Wczytajmy plik [amex-listing.csv]({filename}/files/amex-listings.csv).

```{python}
df = pd.read_csv('amex-listings.csv')
```

Wpierw zobaczmy pierwsze kilka wartości (oraz kilka ostatnich):

```{python}
df.head()
# a może więcej wartości np. 10
df.head(10)
# i od końca
df.tail()
df.tail(10)
```

Podsumowanie kolumn i ich typów danych otrzymujemy dzieki metodzie _info()_.
> Zawsze sprawdzaj czy załadowane typy danych są odpowiednie i takie których się spodziewałeś.

```{python}
df.info()
```

Jak widać ze względu na braki danych nie wszystkie typy kolumn są prawidłowe.
Ustawmy więc jakie wartości powinny być traktowane jako brak danych.

```{python}
df = pd.read_csv('amex-listings.csv', na_values = ['n/a'])
df.info()
```

Istotne również, aby Pandas odróżniał dla nas kolumny z datami. W przypadku naszych danych typ daty mamy w kolumnie _Last Update_. W przypadku większej ilości kolumn podaj jako parametr listę ([]) nazw.

```{python}
df = pd.read_csv('amex-listings.csv', na_values = ['n/a'], parse_dates = ['Last Update'])
df.info()
```

## Pliki Excela

W analogii do plików csv zobaczmy czy uda się załadować [plik excela]({filename}/files/listings.xlsx)).

```{python}
df = pd.read_excel('listings.xlsx', na_values = 'n/a')
df.info()
```

Nasz plik składa się jednak z trzech arkuszy. Jako, że nie ma żadnego ustawienia w naszym kodzie padnas wczytał pierwszy arkusz. Aby samemu zadecydować, który arkusz chcemy musimy dodać opcję _sheetname_.

```{python}
df = pd.read_excel('listings.xlsx', na_values = 'n/a', sheetname='nyse')
df.info()
```

A co jeśli dodam listę nazw arkuszy ?

```{python}
df = pd.read_excel('listings.xlsx', na_values = 'n/a', sheetname=['nyse','nasdaq'])
df.info()
```

> Collections.OrderedDict has no attribute 'info'

Skoro to słownik to może trzeba użyć jego klucza ?

```{python}
df['amex'].info()
```

Najlepszym sposobem na wczytywanie danych z Excela jest wykorzystanie obiektu _ExcelFile()_.

```{python}
xls = pd.ExcelFile('listings.xlsx')
slownik = xls.sheet_names
print(slownik)
nyse = pd.read_excel(xls, sheetname=slownik[2], na_values='n/a')
nyse.info()
```