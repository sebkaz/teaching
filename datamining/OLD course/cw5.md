title: Klasyfikacja
slug: kNN
category: Cwiczenia
date: 2018-04-12
Author: Sebastian Zajac

# Pivot in Pandas

[Dane do analizy]({filename}/files/sales-funnel.xlsx)

```{Python}
# biblioteki
import numpy as np
import pandas as pd
# załaduj dane

df = pd.read_excel("sales-funnel.xlsx")
df.head()
df["Status"] = df["Status"].astype("category")
df["Status"].cat.set_categories(["won","pending","presented","declined"],inplace=True)
```

## Tabele przestawne

Do każdej tabeli pivot mysisz określić ramke danych oraz wskazać index.

```{Python}
pd.pivot_table(df,index=["Name"])
```

Index może zawierać więcej niż jedną kolumnę.

```{python}
pd.pivot_table(df,index=["Name","Rep","Manager"])
```

## Agregacje

Do wyświetlenia interesujących nas kolumn użyjemy własności _values_

Pierwszym agregatem będzie suma (_np.sum_). Ustawiamy ją dla parametry _aggfunc_.

Możemy korzystać również z listy i podać więcej agregacji.

```{Python}
pd.pivot_table(df,index=["Manager", "Rep"])

pd.pivot_table(df,index=["Manager","Rep"],values=["Price"])
# sumowanie
pd.pivot_table(df,index=["Manager","Rep"],values=["Price"],aggfunc=np.sum)
# wiecej agregacji
pd.pivot_table(df,index=["Manager","Rep"],values=["Price"],aggfunc=[np.mean,len])
```

Opcja columns jest opcjonalna. Warto pamiętać, że agregacje tyczą się opcji values.

```{Python}
pd.pivot_table(df,index=["Manager","Rep"],values=["Price"],columns=["Product"],aggfunc=[np.sum])
```

Wartości NAN

```{Python}
pd.pivot_table(df,index=["Manager","Rep"],values=["Price"],columns=["Product"],aggfunc=[np.sum],fill_value=0)
# dodajmy jeszcze quantity
pd.pivot_table(df,index=["Manager","Rep"],values=["Price","Quantity"], columns=["Product"],aggfunc=[np.sum],fill_value=0)
```

```{Python}
pd.pivot_table(df,index=["Manager","Status"],columns=["Product"],values=["Quantity","Price"],aggfunc={"Quantity":len,"Price":np.sum},fill_value=0)

table = pd.pivot_table(df,index=["Manager","Status"],columns=["Product"],values=["Quantity","Price"],aggfunc={"Quantity":len,"Price":[np.sum,np.mean]},fill_value=0)
table
```

## Zaawansowane Filtrowanie

Z otrzymanej poprzednio tabeli znajdźmy info o _Debra Henley_.

```{Python}
table.query('Manager == ["Debra Henley"]')
```

lub

```{python}
table.query('Status == ["pending","won"]')
```

# Regresja liniowa

Załaduj podstawowe biblioteki

```{Python}
import pandas as pd # obliczenia
import numpy as np # obliczenia
import matplotlib.pyplot as plt # grafika
import seaborn as sns # grafika
%matplotlib inline
```

[Dane do analizy]({filename}/files/USA_Housing.csv)

To już znamy:

- wczytaj
- wyświetl pierwsze kilka wierszy
- podstawowe informacje o typach i null
- podstawowe statystyki zmiennych numerycznych

```{Python}
USAhousing = pd.read_csv('USA_Housing.csv')
USAhousing.head()
USAhousing.info()
USAhousing.describe()
```

Przydatne elementy EDA

- o czym świadczy wynik na wykresie dla zmiennej 4

```{Python}
sns.pairplot(USAhousing)
```

Do przewidywania i modelowania mamy zmienną _Price_. Jak wygląda jej rozkład ? 

```{Python}
sns.distplot(USAhousing['Price'])
```

Określmy korelacje między zmiennymi

```{Python}
USAhousing.corr() # jaka interpretacja ?
sns.heatmap(USAhousing.corr())
```

Wybieramy zmienne modelujące i zmienną modelowaną. 

```{Python}
X = USAhousing[['Avg. Area Income', 'Avg. Area House Age', 'Avg. Area Number of Rooms',
               'Avg. Area Number of Bedrooms', 'Area Population']]
y = USAhousing['Price']
```

Dzielimy zbiór danych na treningowy i walidacyjny.

```{Python}
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.4, random_state=101)
```

Wytrenuj model regresji liniowej

```{Python}
from sklearn.linear_model import LinearRegression # zaladuj biblioteke
lm = LinearRegression() # stwórz obiekt do obliczeń.
lm.fit(X_train,y_train) # dopasuj model
```

Mając model musimy go jeszcze poddać walidacji.

```{Python}
# print the intercept
print(lm.intercept_)
coeff_df = pd.DataFrame(lm.coef_,X.columns,columns=['Coefficient'])
coeff_df
```

Predykcja modelu:

```{Python}
predictions = lm.predict(X_test)
plt.scatter(y_test,predictions)
sns.distplot((y_test-predictions),bins=50);
```

Reszty i metryki

```{Python}
sns.distplot((y_test-predictions),bins=50);
# validacja
from sklearn import metrics

print('MAE:', metrics.mean_absolute_error(y_test, predictions))
print('MSE:', metrics.mean_squared_error(y_test, predictions))
print('RMSE:', np.sqrt(metrics.mean_squared_error(y_test, predictions)))
```

# Regresja logistyczna jako klasyfikator

Załaduj podstawowe biblioteki

```{Python}
import pandas as pd # obliczenia
import numpy as np # obliczenia
import matplotlib.pyplot as plt # grafika
import seaborn as sns # grafika
%matplotlib inline
```

[Dane do analizy]({filename}/files/titanic_train.csv)

wczytaj i przejrzyj dane

```{Python}
train = pd.read_csv('titanic_train.csv')
sns.heatmap(train.isnull(),yticklabels=False,cbar=False,cmap='viridis')
sns.set_style('whitegrid')
sns.countplot(x='Survived',data=train,palette='RdBu_r')
sns.countplot(x='Survived',hue='Sex',data=train,palette='RdBu_r')
sns.countplot(x='Survived',hue='Pclass',data=train,palette='rainbow')
sns.distplot(train['Age'].dropna(),kde=False,color='darkred',bins=30)
train['Age'].hist(bins=30,color='darkred',alpha=0.7)
sns.countplot(x='SibSp',data=train)
train['Fare'].hist(color='green',bins=40,figsize=(8,4))
```

Czyszczenie

```{PYTHON}
plt.figure(figsize=(12, 7))
sns.boxplot(x='Pclass',y='Age',data=train,palette='winter')
def impute_age(cols):
    Age = cols[0]
    Pclass = cols[1]
    
    if pd.isnull(Age):

        if Pclass == 1:
            return 37

        elif Pclass == 2:
            return 29

        else:
            return 24

    else:
        return Age

train['Age'] = train[['Age','Pclass']].apply(impute_age,axis=1)
sns.heatmap(train.isnull(),yticklabels=False,cbar=False,cmap='viridis')
train.drop('Cabin',axis=1,inplace=True)
```

Zmienne kategoryjne

```{Python}
train.info()
sex = pd.get_dummies(train['Sex'],drop_first=True)
embark = pd.get_dummies(train['Embarked'],drop_first=True)
train.drop(['Sex','Embarked','Name','Ticket'],axis=1,inplace=True)
train = pd.concat([train,sex,embark],axis=1)
```

Model

```{Python}
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(train.drop('Survived',axis=1), 
                                                    train['Survived'], test_size=0.30, 
                                                    random_state=101)
from sklearn.linear_model import LogisticRegression
logmodel = LogisticRegression()
logmodel.fit(X_train,y_train)
predictions = logmodel.predict(X_test)
```

Ewaluacja

```{PYTHON}
from sklearn.metrics import classification_report
print(classification_report(y_test,predictions))
```

# Klasyfikacja kNN

```{Python}
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Importing the dataset
df = pd.read_csv('Social_Network_Ads.csv')
X = df.iloc[:,[2,3]].values
y = df.iloc[:,4].values

# Splitting the dataset into the Training set and Test set
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X,y,random_state=0, test_size=0.25)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

# Fitting K-NN to the Training set
from sklearn.neighbors import KNeighborsClassifier
clf = KNeighborsClassifier(n_neighbors = 5, metric = 'minkowski', p = 2)
clf.fit(X_train,y_train)
y_pred = clf.predict(X_test)
# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)

from sklearn.metrics import classification_report, accuracy_score
print(accuracy_score(y_pred,y_test))
print(classification_report(y_pred, y_test))

# Visualising the Training set results
from matplotlib.colors import ListedColormap
X_set, y_set = X_train, y_train
X1, X2 = np.meshgrid(np.arange(start = X_set[:, 0].min() - 1, stop = X_set[:, 0].max() + 1, step = 0.01),
                     np.arange(start = X_set[:, 1].min() - 1, stop = X_set[:, 1].max() + 1, step = 0.01))
plt.contourf(X1, X2, clf.predict(np.array([X1.ravel(), X2.ravel()]).T).reshape(X1.shape),
             alpha = 0.75, cmap = ListedColormap(('red', 'green')))
plt.xlim(X1.min(), X1.max())
plt.ylim(X2.min(), X2.max())
for i, j in enumerate(np.unique(y_set)):
    plt.scatter(X_set[y_set == j, 0], X_set[y_set == j, 1],
                c = ListedColormap(('red', 'green'))(i), label = j)
plt.title('K-NN (Training set)')
plt.xlabel('Age')
plt.ylabel('Estimated Salary')
plt.legend()
plt.show()

# Visualising the Test set results
from matplotlib.colors import ListedColormap
X_set, y_set = X_test, y_test
X1, X2 = np.meshgrid(np.arange(start = X_set[:, 0].min() - 1, stop = X_set[:, 0].max() + 1, step = 0.01),
                     np.arange(start = X_set[:, 1].min() - 1, stop = X_set[:, 1].max() + 1, step = 0.01))
plt.contourf(X1, X2, clf.predict(np.array([X1.ravel(), X2.ravel()]).T).reshape(X1.shape),
             alpha = 0.75, cmap = ListedColormap(('red', 'green')))
plt.xlim(X1.min(), X1.max())
plt.ylim(X2.min(), X2.max())
for i, j in enumerate(np.unique(y_set)):
    plt.scatter(X_set[y_set == j, 0], X_set[y_set == j, 1],
                c = ListedColormap(('red', 'green'))(i), label = j)
plt.title('K-NN (Test set)')
plt.xlabel('Age')
plt.ylabel('Estimated Salary')
plt.legend()
plt.show()
```

# Klasyfikacja Naive Bayes

```{python}
# Naive Bayes

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Social_Network_Ads.csv')
X = dataset.iloc[:, [2, 3]].values
y = dataset.iloc[:, 4].values

# Splitting the dataset into the Training set and Test set
from sklearn.cross_validation import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.25, random_state = 0)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

# Fitting Naive Bayes to the Training set
from sklearn.naive_bayes import GaussianNB
classifier = GaussianNB()
classifier.fit(X_train, y_train)

# Predicting the Test set results
y_pred = classifier.predict(X_test)

# Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)

# Visualising the Training set results
from matplotlib.colors import ListedColormap
X_set, y_set = X_train, y_train
X1, X2 = np.meshgrid(np.arange(start = X_set[:, 0].min() - 1, stop = X_set[:, 0].max() + 1, step = 0.01),
                     np.arange(start = X_set[:, 1].min() - 1, stop = X_set[:, 1].max() + 1, step = 0.01))
plt.contourf(X1, X2, classifier.predict(np.array([X1.ravel(), X2.ravel()]).T).reshape(X1.shape),
             alpha = 0.75, cmap = ListedColormap(('red', 'green')))
plt.xlim(X1.min(), X1.max())
plt.ylim(X2.min(), X2.max())
for i, j in enumerate(np.unique(y_set)):
    plt.scatter(X_set[y_set == j, 0], X_set[y_set == j, 1],
                c = ListedColormap(('red', 'green'))(i), label = j)
plt.title('Naive Bayes (Training set)')
plt.xlabel('Age')
plt.ylabel('Estimated Salary')
plt.legend()
plt.show()

# Visualising the Test set results
from matplotlib.colors import ListedColormap
X_set, y_set = X_test, y_test
X1, X2 = np.meshgrid(np.arange(start = X_set[:, 0].min() - 1, stop = X_set[:, 0].max() + 1, step = 0.01),
                     np.arange(start = X_set[:, 1].min() - 1, stop = X_set[:, 1].max() + 1, step = 0.01))
plt.contourf(X1, X2, classifier.predict(np.array([X1.ravel(), X2.ravel()]).T).reshape(X1.shape),
             alpha = 0.75, cmap = ListedColormap(('red', 'green')))
plt.xlim(X1.min(), X1.max())
plt.ylim(X2.min(), X2.max())
for i, j in enumerate(np.unique(y_set)):
    plt.scatter(X_set[y_set == j, 0], X_set[y_set == j, 1],
                c = ListedColormap(('red', 'green'))(i), label = j)
plt.title('Naive Bayes (Test set)')
plt.xlabel('Age')
plt.ylabel('Estimated Salary')
plt.legend()
plt.show()
```

# SVM

Dane

```{python}
from sklearn.datasets import load_breast_cancer
cancer = load_breast_cancer()
print(cancer['DESCR'])
#data frame
df_feat = pd.DataFrame(cancer['data'],columns=cancer['feature_names'])
df_feat.info()
df_target = pd.DataFrame(cancer['target'],columns=['Cancer'])
```

Analiza

```{python}
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(df_feat, np.ravel(df_target), test_size=0.30, random_state=101)

from sklearn.svm import SVC
model = SVC()
model.fit(X_train,y_train)

predictions = model.predict(X_test)
from sklearn.metrics import classification_report,confusion_matrix
print(confusion_matrix(y_test,predictions))
print(classification_report(y_test,predictions))
```

GRIDsearch

```{python}
param_grid = {'C': [0.1,1, 10, 100, 1000], 'gamma': [1,0.1,0.01,0.001,0.0001], 'kernel': ['rbf']} 

from sklearn.model_selection import GridSearchCV
grid = GridSearchCV(SVC(),param_grid,refit=True,verbose=3)
grid.fit(X_train,y_train)
grid.best_params_
grid.best_estimator_
grid_predictions = grid.predict(X_test)
print(confusion_matrix(y_test,grid_predictions))
print(classification_report(y_test,grid_predictions))


```