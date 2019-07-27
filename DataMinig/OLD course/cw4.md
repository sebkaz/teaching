title: Eksploracyjna analiza danych
slug: statistics
category: Cwiczenia
date: 2018-03-21
Author: Sebastian Zajac

# Zadanie

Wygeneruj dane za pomocą generatora. Jako _random_state_ wpisz numer swojego indeksu.

```{python}
from sklearn import datasets
X,y = datasets.make_classification(n_samples=10**3, n_features = 10, random_state=1234)
```

Podaj wartość **szóstegoo**  wiersza i **drugiej** kolumny. Otrzymaną wartość wpisz do pliku **zad2.txt**. Całość dodaj do repozytorium tak by prowadzący mógł ją odczytać.

# Iris data

Korzystając z biblioteki sklearn wczytaj dane Iris.

```{python}
from sklearn import datasets
iris = datasets.load_iris()
df = pd.DataFrame(iris.data, columns = iris.feature_names)
# przyda się kopia do późniejszej analizy
df_features = df.copy()
df['target'] = iris.target
```

Metody **EDA** (ang. _Exploratory Data Analysis_) dostępne dla ramki danych:

1. dtypes, astype()

```{python}
df.dtypes
# zamiana typów kolumn
df['name'] = df.['name'].astype('int')
```

2. describe()- generuje podstawowe statystyki ale działa tylko dla kolumn liczbowych

```{python}
df.describe()
```

3. quantile() - aby otrzymać bardziej szczegółowe dane na temat kwantyli.

```{python}
df.quantile([0.1, 0.5, 0.9])
df['sepal length (cm)'].quantile([0.2])
```

4. unique()  - dla zmiennych kategoryjnych

```{python}
df['target'].unique()
```

5. Metody agregujące (porównaj do SQL) - mean(), sum(), avg(), var(), count(), groupby().

```{python}
grouped_target = df.groupby(['target])
grouped_target_mean = grouped_target.mean()
grouped_target_var = grouped_target.var()
grouped_target_count = grouped_target.count()
```

6. Wybieranie kolumn i wierszy

```{python}
# jedna kolumna jako obiekt Series
df.['target']
# więcej kolumn jako DataFrame
df[['sepal_length','petal_length']]
# lub
lista = ['sepal_length','petal_length']
df = df[lista]
# .loc()
df.loc(50,'target')
df.iloc(50,4)
```

5. boxplot() - pozwala na szybką graficzną prezentację własności zmiennych. wykresy generowane są w postaci tzw. wykresów pudełkowych (patrz wykład).

```{python}
df.boxplot()
# lub dla jednej zmiennej
df.boxplot(column='sepal length (cm)')
grouped_target.boxplot()
grouped_target.boxplot(column='sepal length (cm)')
```

6. Histogramy zmiennych ilościowych

```{python}
df['sepal_length'].plot(kind='hist', alpha=0.5, bins=20)
```

7. Zależności między zmiennymi

```{python}
df.plot(kind="scatter",x='sepal length (cm)',y='petal length (cm)', c='blue')

# dla wszystkich zmiennych
colors = []
palette = {0:"red", 1:"green", 2:"blue"}
for c in np.nditer(iris.target):
    colors.append(palette[int(c)])
df = pd.DataFrame(iris.data, columns=iris.feature_names)
sc = pd.plotting.scatter_matrix(df, alpha=0.3, figsize=(10,10), diagonal="hist", color=colors, marker="o", grid="True")
```

# Dane do analizy

Przeanalizuj następujące [dane]({filename}/files/brain_size.csv)

```{python}
"";"Sex";"FSIQ";"VIQ";"PIQ";"Weight";"Height";"MRI_Count"
"1";"Female";133;132;124;"118";"64.5";816932
"2";"Male";140;150;124;".";"72.5";1001121
"3";"Male";139;123;150;"143";"73.3";1038437
"4";"Male";133;129;128;"172";"68.8";965353
"5";"Female";137;132;134;"147";"65.0";951545
```

Wczytaj dane do ramki danych. Dlaczego nie użyjesz tablicy NumPy ?

```{python}
# czy to wystarczy ?
data = pd.read_csv('brain_size.csv')
```

## Podsatwowe informacje o danych

Wpierw sprawdź ilość wierszy i kolumn.

```{python}
data.shape
```

Wypiszmy nazwy kolumn.

```{python}
list(data)
```

Zobaczmy podstawowe statystyki dla danych liczbowych.

```{python}
data.describe()
```

Mamy jedną zmienną kategoryjną - płeć. Pogrupujmy dane i sprawdzmy średnią wartość zmiennej _VIQ_ w każdej grupie.

```{python}
print(data['Sex'])
# prosty selector
data[data['Sex] == 'Female']['VIQ'].mean()
# grupowanie
groupby_sex = data.groupby('Sex')

gropuby_sex.mean()

groupby_sex.boxplot()

for element, value in groupby_sex['VIQ']:
    print(element,value.mean())
```

### Sprawdź czy potrafisz

1. What is the mean value for VIQ for the full population?
2. How many males/females were included in this study?

Szybki przegląd zmiennych

```{python}
from pandas.tools import plotting
plotting.scatter_matrix(data[['Weight', 'Height', 'MRI_Count']])
plotting.scatter_matrix(data[['PIQ', 'VIQ', 'FSIQ']])
```

## Proste testy statystyczne

```{python}
from scipy import stats
```

1. Czy średnia w populacji dla danej zmiennej jest równa wybranej wartości ?
    - test 1-sample t-tsest *ttest_1samp()* zwracający p-value.
    - Czy średnie IQ jest równe 0

```{python}
stats.ttest_1samp(data['VIQ'],0)
```

2. Czy wartości średnie w grupach są takie same ?
    - test 2-sample t-test *test_ind()*
    - Czy IQ jest takie samo u kobiet i u mężczyzn ?

```{python}
female_viq = data[data['Gender'] == 'Female']['VIQ']
male_viq = data[data['Gender'] == 'Male']['VIQ']
stats.ttest_ind(female_viq, male_viq)
```

> **SOMETIMES THE QUESTIONS ARE COMPLICATED AND THE ANSWERS ARE SIMPLE **
>*Dr. Seuss*

## Rzut monetą

Rzucasz monetą 30 razy i 24 razy wypada $O$. Czy moneta jest uczciwa?

**Hypothesis 1**: Uczciwa moneta powinna dać 15 $O$ w 30 rzutach. Moneta jest oszukana.

**Hypothesis 2**: Ale przecież nawet uczciwa moneta może dać 24 $O$ w 30 rzutach. Przypadek.

## Co na to statystyka ?

$P(O) =$ ?

$P(OO) =$ ?

$P(ROO) =$ ?

A jakie jest prawdopodobieństwo : $P(2\times O \quad i \quad 1\times R) =$ ?

Uogólniając:
$P(x)=\frac{n!}{x!(n-x)!}p^x(1-p)^{n-x}$

Czyli jakie jest prawdopodobieństwo wyrzycenia 24 $O$ ($x$) w 30 rzutach ($n$)?

## Zróbmy symulacje

Uruchom eksperyment 100 000 razy. Znajdź ile procentowo razy pojawia się 24 lub więcej $O$. Jeżeli wyjdzie więcej niż $5\%$ oznaczać będzie to że moneta jest oszukana.

```{Python}
import numpy as np

total_rzuty = 30
liczba_orlow = 24
prawd_orla = 0.5

# 0 = reszka, 1 = orzeł

# wygeneruj jeden eksperyment
experiment = np.random.randint(0,2,total_rzuty)

print("Dane Eksperymentalne :{}".format(experiment))

#Policz liczbę orłów
ile_orlow = experiment[experiment==1].shape[0]

print("Liczba orłów w eksperymencie:", ile_orlow )
```

Teraz potrzebujemy takich eksperymentów więcej. Napiszmy funkcję która wykona ten eksperyment tyle razy ile sobie zarzyczymy (np. $100$).

```{python}
def rzut_moneta_eksperyment(ile_razy_powtorzyc):
    head_count = np.empty([ile_razy_powtorzyc,1],dtype=int)
    for times in np.arange(ile_razy_powtorzyc):
        experiment = np.random.randint(0,2, total_rzuty)
        head_count[times] = experiment[experiment==1].shape[0]
    return head_count
```

```{python}
head_count = rzut_moneta_eksperyment(100)
head_count[:10]
print("Wymiar:{} \n Typ: {}".format(head_count.shape,type(head_count)))
```

Najlepiej zobrazować wyniki wykresem:

```{python}
import matplotlib.pyplot as plt
%matplotlib inline
import seaborn as sns
sns.set(color_codes = True)

sns.distplot(head_count, kde=False)
sns.distplot(head_count, kde=True)
```

Ile razy dostaliśmy 24 (bądź więcej) orłów ?

```{Python}
print('Otrzymaliśmy {} orłów. Co stanowiło {} procent'.format(head_count[head_count >= 24].shape[0],(head_count[head_count>=24].shape[0]/float(head_count.shape[0])*100)))
```

## Czy moneta jest uczciwa ?

Zweryfikuj ten eksperyment przy 1 000 000 powtórzeń.

**W jednym z kroków obliczamy pętle po wszystkich wynikach.**

```{Python}
def coin_toss_experiment(times_to_repeat):

    head_count = np.empty([times_to_repeat,1], dtype=int)
    experiment = np.random.randint(0,2,[times_to_repeat,total_rzuty])
    return experiment.sum(axis=1)
```