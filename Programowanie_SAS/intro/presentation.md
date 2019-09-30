Wstęp do programowania
========================================================
author: dr Sebastian Zając
date: 
autosize: true

Czego będziemy się uczyć ?
========================================================

- Przetwarzanie danych w SAS
- Raportowanie w SAS
- Statystyka w SAS

BIG DATA
========================================================

BIG DATA - technologia przetwarzania dużej ilości danych rozwijająca się od 2001 roku

[Laney Douglas: 3D Data Management: Controlling Data Volume, Velocity and Variety](https://blogs.gartner.com/doug-laney/files/2012/01/ad949-3D-Data-Management-Controlling-Data-Volume-Velocity-and-Variety.pdf)

## 3V, a nawet 5V

- **Volume** - duże dane
- **Velocity** - szybko się zmieniające
- **Variety** - różnorodne, strukturyzowane i bez struktury.
- Veracity - prawdziwość
- Value - wartość


===========

Pojawiające się nowe wyzwania naukowe jak i biznesowe takie jak: 
- inteligentna reklama tysięcy produktów dla milionów klientów,
- przetwarzanie danych o genach, RNA czy też białkach
- inteligentne wykrywanie różnorodnych sposobów nadużyć wśród setek miliardów transakcji kart kredytowych,
- symulacje giełdowe oparte o tysiące instrumentów finansowych,
- rozpoznawanie miliardów przypadków efektów zderzeń protonów i produkcji cząstek elementarnych w LHC

========================================================

## Główne zastosowanie - modele predykcyjne
## Optymalizacja zautomatyzowanych procesów (on-line)

## Główne idee:
- Pozwól mówić danym
- Nie ważne dlaczego, ważne, że działa !
- not why, but what
- Najważniejsze, że da się zrobić i zarabiać na tym !!!
- Gromadźmy dane bez ich pierwotnego przeznaczenia

inne
==============

## Przekształcanie danych w cenną wiedzę

## Dane jako największe aktywa firmy
[SAS Student Ambassador 2014]("http://manager.inwestycje.pl/manager_360/Rafal-Wojdan;244301;0.html)

[How to be a Data Scientist using SAS](http://support.sas.com/resources/papers/proceedings14/1486-2014.pdf)

[Road Map](http://nirvacana.com/thoughts/2013/07/08/becoming-a-data-scientist/)


Data Scientists (inżynier danych)
===========

**Data Scientist** - najseksowniejszy zawód XXI wieku (Harvard Business Review 2012)
### Wiele umiejętności
- Statystyka, Informatyka, Biznes, Matematyka, Fizyka 
- Komunikacja, Kreatywność

### i kompetencji ... 

- programowanie: C++, Java, Python, R, SAS 4GL ...


===============

- Znajomość systemów operacyjnych i ich narzędzi: (Czym jest Docker ?) Hadoop, Spark, Kafka,  Linux (Windows... także), Oracle...
- Statystyka/Data Mining/Machine Learning/Deep Learning: Regresja liniowa, logistyczna, sieci neuronowe, drzewa, lasy losowe, analiza skupień...

### Pośrednik między IT i biznesem

### Pośrednik między nauką a biznesem

Myślenie
============

### Myślenie biznesowe:
- Ile zarobimy, ile stracimy ?  Wżniejsze są plany bliższe i pieniądze w zasięgu ręki !
- Szybki sukces się liczy!

### Myślenie operacyjne:

- Jak utrzymać proces, status quo? Nie zwiększajmy kosztów, róbmy efektywniej !


==============

### Myślenie zarządcze:
- Wystarczy 20% trudu, bo daje 80% efektów. Pareto działa!

### Myślenie statystyczne:
- Estymować liczby ukryte, trunde do zaobserwowania
- areto nie działa w trudzie analiz, każda analiza daje większe efekty i zrozumienie procesu
- Znaleźć proporcje pomiędzy udziałem zystkownych klientów a klientami odrzuconymi i zniechęconymi

Zakres wiedzy
=========================================================


## Matematyka

Algebra liniowa - wektory, macierze, pochodne, wartości i wektory własne, metody numeryczne, prawdopodobieństwo.

## Statystyka

Metody zbierania, analizy i interpretacji danych.

## Computer Science

Nauka tworzenia narzędzi do analizy danych. Potrzebna wiedza dotyczy: _programowania_, _zarządzania bazami dancyh_, _zarządzanie sieciami_, _systemy dyskowe_, _high-performance computing (Python)_.


Zakres wiedzy
=========================================================

## Artificial intelligence (AI)

Algorytmy symulujące proces uczenia się maszyn.

## Machine Learning

Uczenie komputerowych algorytmów.

## Wizualizacja danych

Dobra prezentacja danych pozwala szybko odczytać ważne informacje

## Wiedza ekspercka

Znajomość analizowanej dziedziny: finanse, administracja, biznes, nauka itp.


Realizacja zadań nauki o danych wymaga wielu specjalistów.



Nowe paradygmaty 
=================
## Hurtownie danych
- Wpierw oczyść potem załaduj (ETL)(stare)
- Załaduj i potem się martw (nowe)

## Modelowanie, prognozowanie
- Znajdź przyczynę i skutek, obserwuj istotne zmienne (stare)
- Sprawdź, które ze zgromadzonych danych wpływają na modelowe zdarzenie, zależności od zmiennych pochodnych (nowe)


Mity w Big Data
====================
* Istnieją gotowe narzędzia, które potrafią wykorzystać dane do rozwiązywania problemów.
* Proces Big Data może być w pełni zautomatyzowany, można go szybko wyklikać i nie wymaga nadzoru.
* Eksploracja danych zwraca się szybko.
* Pakiety oprogramowania do Big Data są intuicyjne i łatwe w użyciu.
* Big Data automatycznie wyczyści niechlujną bazę danych.
* Big Data zidentyfikuje nasze problemy oraz ich przyczyny.


Szumnie o Big Data
===========================
Zachowaj sceptycyzm słysząc o Big Data gdyż:

1. Brak definicji najbardziej podstawowych terminów. Czym jest Big Data? Gdzie uprawia się Big Data ? Czy chodzi o naukę czy o technologię ? Ile to jest Big ? 
2. Brak poszanowania dla innych naukowców: od kiedy znana jest statystyka, matematyka, informatyka ? Big Data jest zawsze *NEW*, czy dane z Google tylko teraz są wielkie ? Szanuj wiedzę swoich poprzedników.
3. Nauka o danych - połączenie statystki i inżynierii technologicznej


Niepowodzenia BIG Data
===============

- Brak dobrych business case
- Dane są zbierane, ale zbyt mało uzasadnia ich przydatność
- Lekceważenie problemów jakości danych
- Umniejszanie problemu wnioskowania na podstawie obciążonej próby
- Zbyt duży nacisk na technologię
- Złudne nadzieje szybkiego ,,klikania modelu''
- Brak inwestycji  w przygotowanie i wykształcenie inżyniera danych
- Dostęp do danych, nawet przykładowych
