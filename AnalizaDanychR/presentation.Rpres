Analiza danych w R
========================================================
author: Sebastian Zając
date: 
autosize: true

Dane
========================================================


Rozwój technologii przyczynił się do powstania nowego niewyczerpalnego zasobu. Jest on produkowany w **ustrukturyzowanej** oraz **nieustrukturyzowanej** formie. Postaci te dają szerokie spektrum jego magazynowania i przetwarzania, dzięki czemu wykonywanie codziennych czynności jak np. zakupy, przejazdy z jednego miejsca w inne, komunikacja z innymi ludźmi czy choćby wyrażanie swoich opinii zmieniły się, a także i całą naszą rzeczywistość, do nieznanych nawet w epoce pary i papieru, szybkości i objętości.

**Dane**,  spowodowały wyprodukowanie tysięcy nowych narzędzi do generowania, zbierania, przechowywania i przetwarzania informacji na niespotykaną dotąd skalę.



========================================================

Narzędziami cyfrowego generowania danych są między innymi **kody kreskowe, karty płatnicze, aparaty cyfrowe, email, sieci RFID, edytory tekstu** itp.

Pojawiające się nowe wyzwania naukowe jak i biznesowe takie jak: 
- inteligentna reklama tysięcy produktów dla milionów klientów,
- przetwarzanie danych o genach, RNA czy też białkach
- inteligentne wykrywanie różnorodnych sposobów nadużyć wśród setek miliardów transakcji kart kredytowych,
- symulacje giełdowe oparte o tysiące instrumentów finansowych,
- rozpoznawanie miliardów przypadków efektów zderzeń protonów i produkcji cząstek elementarnych w LHC

========================================================

stają się możliwe do realizacji dzięki budowie systemów opartych na otwartym oprogramowaniu. Dziś rozproszone systemy takie jak **Apache Hadoop, Apache Spark, Microsoft Azure** czy **SAS** używane są na szeroką skalę w wielu instytucjach i firmach niemal w każdej dziedzinie gospodarki. 

Epoka ,,wielkich danych'' stawia przed nami coraz to nowsze wyzwania związane nie tylko z ilością, ale i z czasem przetwarzania danych. 

Nie byłoby możliwości praktyczengo wykorzystania danych bez **nauki o danych**, którą można zdefiniować jako naukę o posługiwaniu się narzędziami do przetwarzania surowych danych.

========================================================

Policzenie ilu spośród miliona użytkowników, którzy przeszli do drugiego etapu rekrutacji nie ukończyło 30 roku życia stanowi łatwe zadanie dzięki uporządkowaniu danych według jakiegoś określonego schematu oraz wykonaniu prostego **zapytania SQL**.

>>> Jak wyglądałoby takie zapytanie ? 

W przypadku dużych firm tego typu zadania biznesowe ułatwia się dzięki zaplanowaniu struktury i uporządkowaniu danych w tzw. **hurtowniach danych** (ang. Data Warehouse).

=========================================================

Stanowiły one bardzo dobre rozwiązanie w przypadku danych strukturyzowanych.Jednak dzisiejsze zapotrzebowania biznesowe oraz nowe rodzaje danych (np. dane z kamer, dźwięk etc.) wymagają od nas wyjścia poza ten model. 

Również zapytania SQL wymagają rozszerzenia o elementy uwzględniające specyficzne cechy danych oraz o możliwość wykonania szybkiej analizy i modelu otrzymanych danych, który pozwala rozszerzyć bazę o takie funkcjonalności jak **generowanie statystyk** czy **uczenie maszynowe** (ang. Machine Learning). 

=========================================================

Szerokim zainteresowaniem cieszą się darmowe narzędzia, które można uruchomić nawet na domowych komputerach tj. język **R** czy biblioteki **Pythona** (Scikit-learn, Pandas, Numpy, TensorFlow, Keras). Zawierają one klasyczne algorytmy uczenia m.in. **regresję, drzewa decyzyjne, lasy losowe** czy też **sieci neuronowe**. 

Umożliwiają one również pisanie w pełni obiektowego kodu co znacznie ułatwia jego utrzymanie, modyfikację oraz wdrażanie do systemów produkcyjnych.  

>>> Zadanie domowe . Napisz kod który pobierze dane Iris i zrobi na nich model drzewa losowego.

Raporty o danych:
=========================================================


- W 2011 powstało $1.8$ zettabajtów danych (12 miliardów dwugodzinnych filmów HD).
- firma IDC Digital Universe przeprowadziła badania *Extracting Value from Chaos*  gdzie odnotowano wzrost danych ponad dwukrotnie co dwa lata (szybciej niż prawo Moore'a).
- $400 000$ TB emaili rocznie (biblioteka kongeru USA to $\sim 10$ TB - 30 mln książek)
- $\sim 40\%$ wszystkich danych na świecie pochodzi z USA

Raporty o danych:
==================

- Serwis Google przetwarza ponad 20 petabajtów danych dziennie
- $90\%$ wszystkich danych powstało w ostatnich dwóch latach. 


Gdzie zostawiasz najwięcej informacji o sobie ?
=========================================================

Mechanizm wyszukiwania Google każdego dnia przetwarza setki milionów zapytań. Każde takie zapytanie reprezentuję jedną transakcję gdzie użytkownik wskazuje jakich informacji potrzebuje. 

>>>Jak myślisz? jaką nową i użyteczną wiedzę można nabyć analizując tak ogromny zbiór zapytań ?


Źródła danych
=========================================================

- Działalność przedsiębiorstw i instytucji (banki, ubezpieczalnie, sieci handlowe, urzędy ...). Sieć sprzedaży Wal-Mart gromadzi dziennie dane dotyczące 20 milionów trnasakcji. AT&T obsługuje miliardy połączeń dziennie. Danych jest tyle, że nie zapisuje się ich a analizy prowadzone są 'on the fly'.
- Ośrodki naukowe: $10^9$ rekordów danych astronomicznych, $10^2 \sim 10^3$ atrybutów w systemach diagnozy medycznej. Very Long Baseline Interferometry posiada 16 teleskopów, gdzie każdy produkuje 1 Gigabit/sec danych astronomicznych w czasie 25 dniowej sesji obserwacyjnej.


WWW jako źródło danych
=========================================================

Jednym z największych źródeł danych jest obecnie **sieć WEB** zawierająca ponad 60 miliardów zaindeksowanych stron wg. [WorldWideWebSize.com](http://www.worldwidewebsize.com). 

- **at least 4.49 billion pages** (Friday, 16 February, 2018), 
- **at least 5.55 billion pages** (Thursday, 14 February, 2019). 
- **at least 6.08 billion pages** (Tuesday, 24 September, 2019).

W  jakim celu przechowuje się tak olbrzymie wolumeny danych ?


=========================================================

>>> - Niewielka część gromadzonych danych analizowanych jest w praktyce !!!
>>> - W jaki sposób efektywnie i racjonalnie wykorzystać zgromadzone dane do celów wspomagania działalności biznesowej ?
>>> - Czy można wykorzystać dane transakcyjne aby zwiększyć sprzedaż i poprawić rentowność ?


Trochę historii
=========================================================
- Lata 60-te : Kolekcje danych, bazy danych, sieciowe DNBMS
- Lata 70-te : Relacyjne modele danych i ich implementacja w systemach OLTP
- Lata 80-te : Zaawansowane modele danych, extended-relational, objective oriented, aplikacyjno-zorientowane itp.
- Lata 90-te : Data mining, hurtownie danych, multimedialne bazy danych, systemy OLAP
- Później : NoSQL, Hadoop, SPARK, data lake

Modele przetwarzania danych
=========================================================

Większość danych przechowywana jest w bazach lub hurtowniach danych. Standardowo dostęp do danych sprowadza się najczęściej do realizacji zapytań poprzez aplikacje. Sposób wykorzystania i realizacji procesu dostępu do bazy danych nazywamy **modelem przetwarzania**.



Model Tradycyjny
=========================================================

**Model tradycyjny** - przetwarzanie transakcyjne w trybie on-line, OLTP (on-line transaction processing). Świetnie sprawdza się  w przypadku obsługi bieżącej np. obsługa klienta, rejestr zamówień, obsługa sprzedaży itp.
Model ten dostarcza efektywnych rozwiązań do:

- efektywne i bezpieczne przeowywanie danych,
- transakcyjne odtwarzanie danych po awarii,
- optymalizacja dostępu do danych,
- zarządzanie współbierznością,
- inne.



=========================================================

A co w przypadku gdy mamy doczynienia z:

- agregacjami danych,
- wspomaganie analizy danych, 
- raportowanie i podsumowania danych,
- optymalizacja złożonych zapytań,
- wpomaganie decyzji biznesowych. 

Badania nad tego typu zagadnieniami doprowadziły do sformułowania nowego modelu przetwarzania danych oraz nowego typu baz danych - **Hurtownie Danych** 


OLAP
=========================================================

**Przetwarzanie analityczne on-line OLAP (on-line analytic processing).**
 Wspieranie procesów analizy i dostarczanie narzędzi umożliwiających analizę wielowymiarową (czas, miejsce, produkt).

 Analiza danych z hurtowni to przede wszystkim obliczanie **agregatów** (podsumowań) dotyczących wymiarów hurtowni. Proces ten jest całkowicie sterowany przez użytkownika.



Przykład
=========================================================

Załóżmy, że mamy dostęp do hurtowni danych gdzie przechowywane są informacje dotyczące sprzedaży produktów w supermarkecie. Jak przeanalizować zapytania:

1. Jaka jest łączna sprzedaż produktów w kolejnych kwartałach, miesiącach, tygodniach ?
2. Jaka jest sprzedaż produktów z podziałem na rodzaje produktów ?
3. Jaka jest sprzedaż produktów z podziałem na oddziały supermarketu ?

Odpowiedzi na te pytania pozwalają określić „wąskie gardła” sprzedaży produktów przynoszących deficyt, zaplanować zapasy w magazynach czy porównać sprzedaż różnych grup w różnych oddziałach supermarketu.


OLAP -> Data Mining
=========================================================

OLAP to : analiza danych hurtowni sterowana całkowicie przez użytkownika. Użytkownik formułuje zapytania i dokonuje analizy. Rozszerzenie standardu języka dostępu do baz danych SQL o możliwość efektywnego przetwarzania złożonych zapytań zawierających agregaty.


Wady OLAP
=========================================================

- Oferowanie zbyt szczegółowego poziomu abstrakcji
- Brak możliwości formułowania bardziej ogólnych zapytań, np. Jakie czynniki kształtują popyt? czym różnią się klienci w sklepie A od klientów w sklepie B? jakie produkty kupowane są wraz z piwem ? czy można przewidzieć popyt na określone produkty ? jakie są ogólne korelacje sprzedaży ze względu na lokalizacje i asortyment ? ...
- Brak automatyzacji procesu analizy oraz ograniczony zakres analizy.

>>> Rozwiązanie ?
>>> EKSPLORACJA DANYCH (Data Mining)



Definicje
=========================================================

> Eksploracja danych jest procesem odkrywania znaczących nowych powiązań, wzorców i trendów przez przeszukiwanie zgromadzonych danych przy wykorzystaniu metod rozpoznawania wzorców, jak również metod statystycznych i matematycznych.

> Eksploracja danych jest między dyscyplinarną dziedziną, łącząca techniki uczenia maszynowego, rozpoznawania wzorców, statystyki, bez danych i wizualizacji w celu uzyskiwania informacji z dużych baz danych.

Wszystkie definicje wskazują, iż celem eksploracji danych jest odkrywanie zależności które nie były wcześniej znane odbiorcy.



=========================================================

W wyniku realizacji procesu eksploracji danych otrzymujemy:

>>> MODEL lub WZORZEC.

Modelami mogą być:

- równania liniowe,
- reguły,
- skupienia,
- grafy,
- struktyry drzewiaste,
- wzory rekurencyjne w szeregach czasowych.

Rola badacz DM - jak znaleźć informacje, których wzorce są nieznane i mogą być użyteczne ?


Data Scientists
=========================================================

Analiza danych to proces w którym dane zostają uszeregowane i przeorganizowane tak by dzięki różnym metodom wyjaśnić przeszłość i przewidzieć przyszłość (Fizyka ?)
To nauka o zadawaniu pytań, odkrywaniu wyjaśnienia i stawiania hipotez.

**Data Scientist** - najseksowniejszy zawód XXI wieku (Harvard Business Review 2012)

- Statystyka, Informatyka, Biznes, Matematyka, Fizyka ...
- Komunikacja, Kreatywność

Umiejętności, kompetencje
=========================================================

- Programowanie: C++, Java, Python, R, SAS 4GL ...
- Znajomość systemów operacyjnych i ich narzędzi: (Czym jest Docker ?) Hadoop, Spark, Kafka,  Linux (Windows... także), Oracle...
- Statystyka/Data Mining/Machine Learning/Deep Learning: Regresja liniowa, logistyczna, sieci neuronowe, drzewa, lasy losowe, analiza skupień...
- Pośrednik między IT i biznesem
- Pośrednik między nauką a biznesem
- Przekształcanie danych w cenną wiedzę
- Dane jako największe aktywa firmy


inżynier danych - myślenie
========================

### Myślenie biznesowe:
- Ile zarobimy, ile stracimy ?  Wżniejsze są plany bliższe i pieniądze w zasięgu ręki ! Szybki sukces się liczy!

### Myślenie operacyjne:
- Jak utrzymać proces, status quo? Nie zwiększajmy kosztów, róbmy efektywniej !


inżynier danych - myślenie
========================

### Myślenie zarządcze:
- Wystarczy 20% trudu, bo daje 80% efektów. Pareto działa!

### Myślenie statystyczne:
- Estymować liczby ukryte, trunde do zaobserwowania
- Pareto nie działa w trudzie analiz, każda analiza daje większe efekty i zrozumienie procesu
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
==============

![Img](img/rys1.png)





Cel analizy danych
============

Cztery podstawowe cele każdej analizy danych 

**Zrozumieć, Przewidzieć, Sprawdzić, Zobaczyć**.

- __Zrozumieć__ to cel eksploracyjnej analizy danych. Wykorzystaj wykresy, tabele, modele aby poszerzyć wiedzę o zależnościach w danych.

- __Przewidzieć__ (analiza predykcyjna) przyszłe wartości zmiennej na podstawie innych zmiennych. Wyróżniamy dwa podejścia - czarna skrzynka (bez modelu) oraz biała skrzynka (z modelem ). 

- __Sprawdź__ czy twoje hipotezy są prawidłowe za pomocą testów statystycznych. 

- __Zobaczyć__ opis zjawiska poprzez wykresy.   




Metodyka CRISP-DM
===================
**CRoss Industry Standard Process for Data Mining**:

Określony w 1996 standardowy proces dopasowania eksploracji danych do ogólnej strategii rozwiązywania problemów komórki biznesowej lub badawczej.

Metodyka CRISP-DM
======================
![CRISP1](img/rys2.png)




========================
## Zrozumienie problemu

Jasne sformułowanie celów i wymagań projektu w terminologii komórki biznesowej. Stworzenie wstępnego planu działania. Wstępna analiza czy posiadane dane pozwolą uzyskać odpowiedź na problem.

## Zrozumienie danych

Zebranie surowych danych. Wstępna analiza danych, odkrycie pierwszych zależności. Ocena jakości danych. Wybranie interesujących podzbiorów danych. Znając problem, możemy ocenić czy dostępne dane pozwolą go rozwiązać. Na tym etapie może okazać się, że dane są niezrozumiałe, wtedy konieczne jest zasięgnięcie opinii ekspertów w danej dziedzinie (np. pracowników firmy).

=====================
## Przygotowanie danych

Przygotowanie ostatecznego zrobiu danych - **najbardziej czasochłonny i pracochłonny etap**. Wykonanie koniecznych przekształceń danych. Wyczyszczenie danych. Pierwszy etap eksploracji danych, często zautomatyzowany.

## Modelowanie

Wybór i zastosowanie odpowiednich technik medelujących i modeli. Dobór parametrów modelu. Często powrót do poprzednich faz, aby dostosować dane do wybranych technik.


==================

## Ewaluacja

Ocena modelu pod kątem jakości, efektywności, wiarygodności oraz przydatności. Ustalenie czy model spełnia postawione wymagania. Decyzja o wdrożeniu bądź powrót do poprzednich etapów.

## Wdrożenie

Wykorzystanie modelu. Sporządzenie raportu. Stworzenie aplikacji wykorzystującej model.

**Proces eksploracji danych NIE sprowadza się do zastosowania wyrafinowanych algorytmów do posiadanych danych**. Wręcz przeciwnie, tworzenie modeli z reguły zajmuje $10\%$ czasu projektu.

Odkrywanie wiedzy
==========================

![CRISP2](img/rys3.png)



**Etapy w procesie odkrywania wiedzy**:

1. Czyszczenie danych (data cleaning) - pozbądź się nieistotnych, niepełnych, niepoprawnych danych.
2. Integracja danych (data integration) - łączenie danych z różnych źródeł w jeden zintegrowany zbiór.
3. Selekcja danych (data selection) - selekcja danych istotnych z punktu widzenia procesu analizy.

Odkrywanie wiedzy
==========================

4. Konsolidacja i transformacja danych (data transformation) - przekształcenie wybranych danych do postaci wymaganej przez metody eksploracji danych.
5. Eksploracja danych - odkrywanie potencjalnie użytecznych wzorców
6. Ocena modeli (pattern evaluation) - ocena i identyfikacja ciekawych wzorców.
7. Wizualizacja modeli


======================
**Eksploracja danych** to jeden z etapów procesu odkrywania wiedzy. Pozostałe etapy to przygotowanie danych, selekcja, czyszczenie, definiowanie dodatkowej wiedzy przedmiotowej, interpretacja wyników eksploracji, wizualizacja.

W hurtowniach danych wiele z tych etapów (ETL) są zautomatyzowane.

Wzorce zazwyczaj są prezentowane ale można je również przechowywać w bazach danych.


Mity w Data Mining
====================
* Istnieją gotowe narzędzia, które potrafią wykorzystać dane do rozwiązywania problemów.
* Proces Data Mining może być w pełni zautomatyzowany, można go szybko wyklikać i nie wymaga nadzoru.
* Eksploracja danych zwraca się szybko.
* Pakiety oprogramowania do Data Mining są intuicyjne i łatwe w użyciu.
* Data Mining automatycznie wyczyści niechlujną bazę danych.
* Data Mining zidentyfikuje nasze problemy oraz ich przyczyny.


Klasyfikacja metod eksploracji danych
===================
## Modele deskrypcyjne

Zadaniem każdego modelu powstającego podczas eksploracji danych jest dostarczenie pewnych wyjaśnień **nawet jeżeli nie jest on używany do opisywania zależności, to wyniki bazują na wydobytych z tych danych informacji**. Modele te mają opowiadać użytkownikom o tym kim są klienci firmy, jak podejmują decyzje o skorzystaniu z usług firmy, jak wygląda proces produkcji itp. Prezentowane w postaci terminów biznesowych a nie samych danych. Wskazują nietypowe przypadki i zjawiska. 

Klasyfikacja metod eksploracji danych
===================
## Modele predykcyjne

Zadaniem modeli predykcyjnych jest jak najdokładniejsze i możliwie wiarygodne uzupełnienie brakujących danych. Np. ocena ryzyka udzielenia pożyczki, wielkość zysków firmy, czas bezawaryjnego działania urządzeń.

### UWAGA. Procesy tworzenia modeli predykcyjnych i deskrypcyjnych nie różnią się od siebie.


===============================
Ze względu na cel eksploracji metody dzielimy na:

1. Odkrywanie asocjacji. Inaczej nazywana analizą koszykową (market basket analysis). Wykrywanie elementów występujących razem w określonych transakcjach oraz określenie reguł decydujących o pojawieniu się danych zestawów.
2. Klasyfikacja. Polega na znalezieniu sposobu odwzorowania danych w zbiór predefiniowanych klas. Stosowane w rozpoznawaniu obiektów, scoring bankowy, rozpoznawanie trendów. Bazuje głównie na drzewach decyzyjnych, regresji logistycznej, klasyfikatorach Bayes'a, sieciach  neuronowych, SVM i innych.
3. Regresja. Podobna do klasyfikacji dla zmiennych ciągłych.


=======================================

4. Grupowanie (segmentacja, clustering). Algorytm wybierający atrybuty decydujące o przynależności do danej klasy. Realizowany jako proces iteracyjny (przerywany, gdy granice grup są stabilne). Na jego podstawie opisujemy dane jako zbiór rozłącznych kategorii.
5. Analiza sekwencji i przebiegów czasowych Odkrywanie charakterystyk. Analiza ruchu sieci web, wyodrębnienie zdarzeń występujących w sekwencji
6. Eksploracja tekstu
7. Eksploracja grafów i sieci społecznościowych 
8. Eksploracja danych multimedialnych wykrywanie punktów osobliwych


Zastosowania
================
Początkowo analizowano proste typy danych: liczby, łańcuchy, daty.

Obecnie analizuje się :

1. Multimedia: zdjęcia, filmy, muzyka
2. Dane przestrzenne: mapy.
3. Tekst
4. Szeregi czasowe
5. Grafy
6. Sieci społecznościowe
7. Struktury chemiczne, RNA, DNA, białka



Uczenie maszynowe (Machine Learning)
==============

Za pomocą ML identyfikujemy procesy, dzięki którym zdobywamy wiedzę nie zawsze możliwą do bezpośredniego wnioskowania z danych, a jednocześnie przydatną do podejmowania decyzji. Jest narzędziem stosowanym do wieloskalowego przetwarzania danych i świetnie nadaje się do obsługi złożonych zbiorów danych. Zdolność predykcji modeli ML wykorzystuje się bardzo często do systemów sztucznej inteligencji (**AI**).

1. Uczenie nadzorowane (_supervised_)
2. Uczenie nienadzorowane (_unsupervised_)
3. Uczenie przez wzmocnienie (_reinforcement learning_)

W pythonie uczeniu maszynowemu poświęcony jest pakiet _scikit-learn_. 

Algorytmy
===========
- regresja liniowa
- regresja logistyczna
- drzewa decyzyjne
- k-średnie
- naiwny Bayes
- ...


Sieci neuronowe
=================
 
Perceprton jako jednowarstwowa sieć w przód.

>> Zadanie
>> Kiedy powstała pierwsza sieć neuronowa (Perceptron) ?

>> Zadanie
>> Przypomnij sobie własności iloczynu skalarnego


Deep learning-zastosowanie praktyczne
==============


1. _AlphaGo_ to maszyna ze sztuczną intelignecją bazującą na uczeniu głębokim, która w 2016 roku pokonała mistrza w grze Go (Lee Sedol).

2. 2009 - Netflix system rekomendacji (nagroda 1 000 000 dolarów)

3. 2013 rok - wykorzystanie metod uczenia maszynowego do wykrywania i identyfikacji ptaków na podstawie danych dźwiękowych.

4. 2015 - Na podstawie dancyh o pogodzie, terenie, badaniach i opryskach przewidzieć kiedy i gdzie określone gatunki komarów przejdą pozytywny wynik  testu na roznoszenie wirusa Zachodniego Nilu.


Deep learning-zastosowanie praktyczne
==============
5. 2015 - Prognoza cen wynajmu mieszkań w Australii Zachodniej

6. 2016 - Przyśpieszenie procesu zarządzania reklamacjami

7. inne - pojazdy bezzałogowe, system rozpoznawania celów, systemy czytające notatki lekarskie, systemy wykrywania twarzy



BIG DATA 
============

technologia przetwarzania dużej ilości danych rozwijająca się od 2001 roku [Laney Douglas: 3D Data Management: Controlling Data Volume, Velocity and Variety](https://blogs.gartner.com/doug-laney/files/2012/01/ad949-3D-Data-Management-Controlling-Data-Volume-Velocity-and-Variety.pdf)

### 3V, a nawet 5V

- **Volume** - duże dane
- **Velocity** - szybko się zmieniające
- **Variety** - różnorodne, strukturyzowane i bez struktury.
- **Veracity** - prawdziwość
- **Value** - wartość


Główne idee:
=================

- Pozwól mówić danym
- Nie ważne dlaczego, ważne, że działa !
- not why, but what
- Najważniejsze, że da się zrobić i zarabiać na tym !!!
- Gromadźmy dane bez ich pierwotnego przeznaczenia

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


Szumnie o Big Data
===========================
Zachowaj sceptycyzm słysząc o Big Data gdyż:

1. Brak definicji najbardziej podstawowych terminów. Czym jest Big Data? Gdzie uprawia się Big Data ? Czy chodzi o naukę czy o technologię ? Ile to jest Big ? 
2. Brak poszanowania dla innych naukowców: od kiedy znana jest statystyka, matematyka, informatyka ? Big Data jest zawsze *NEW*, czy dane z Google tylko teraz są wielkie ? Szanuj wiedzę swoich poprzedników.
3. Nauka o danych - połączenie statystki i inżynierii technologicznej



