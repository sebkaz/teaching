from math import sqrt

critics = {'Lisa Rose':{'Kobieta w błękitnej wodzie': 2.5,
                        'Węże w samolocie':3.5,
                        'Całe szczęście':3.0,
                        'Superman: Powrót':3.5,
                        'Ja, ty i on':2.5,
                        'Nocny słuchacz':3.0}, 
           'Gene Seymour':{'Kobieta w błękitnej wodzie': 3.0,
                        'Węże w samolocie':3.5,
                        'Całe szczęście':1.5,
                        'Superman: Powrót':5.0,
                        'Ja, ty i on':3.5,
                        'Nocny słuchacz':3.0}, 
           'Michael Phillips':{'Kobieta w błękitnej wodzie': 2.5,
                        'Węże w samolocie':3.0,
                        'Całe szczęście':3.0,
                        'Superman: Powrót':3.5,
                        'Nocny słuchacz':4.0},
           'Claudia Puig':{'Węże w samolocie':3.5,
                        'Całe szczęście':3.0,
                        'Superman: Powrót':4.0,
                        'Ja, ty i on':2.5,
                        'Nocny słuchacz':4.5},
           'Mick LaSalle':{'Kobieta w błękitnej wodzie': 3.0,
                        'Węże w samolocie':4.0,
                        'Całe szczęście':2.0,
                        'Superman: Powrót':3.0,
                        'Ja, ty i on':2.0,
                        'Nocny słuchacz':3.0},
           'Jack Matthews':{'Kobieta w błękitnej wodzie': 3.0,
                        'Węże w samolocie':4.0,
                        'Całe szczęście':2.0,
                        'Superman: Powrót':5.0,
                        'Ja, ty i on':3.5,
                        'Nocny słuchacz':3.0},
           'Tobby':{'Węże w samolocie':4.5,
                    'Superman: Powrót':4.0,
                    'Ja, ty i on':1.0}
          }

def sim_manhatan(prefs, person1, person2):
    si={}
    for item in prefs[person1]:
        if item in prefs[person2]:
            si[item]=1
    if len(si)==0:
        return 0
    
    sum_of_manhatan = sum([abs(prefs[person1][item]-prefs[person2][item]) for item in prefs[person1] if item in prefs[person2]])
    return 1/(1+sum_of_manhatan)

def sim_distance(prefs, person1, person2):
    si={}
    for item in prefs[person1]:
        if item in prefs[person2]:
            si[item]=1
    if len(si)==0: 
        return 0
    
    sum_of_squares= sum([pow(prefs[person1][item]-prefs[person2][item], 2) for item in prefs[person1] if item in prefs[person2]])
    return 1/(1+sum_of_squares)

def sim_pearson(prefs, p1,p2):
    si ={}
    for item in prefs[p1]:
        if item in prefs[p2]:
            si[item]=1
    n=len(si)
    if n==0:
        return 0
    sum1=sum([prefs[p1][it] for it in si])
    sum2=sum([prefs[p2][it] for it in si])
    
    sum1Sq=sum([pow(prefs[p1][it],2) for it in si])
    sum2Sq=sum([pow(prefs[p2][it],2) for it in si])
    
    pSum=sum([prefs[p1][it]*prefs[p2][it] for it in si])
    
    num=pSum-(sum1*sum2/n)
    den=sqrt((sum1Sq-pow(sum1,2)/n)*(sum2Sq-pow(sum2,2)/n))
    return num/den

def topMatches(prefs, person, n=5, similarity=sim_distance):
    scores = [(similarity(prefs, person, other), other) for other in prefs if other!=person]
    scores.sort()
    scores.reverse()
    return scores[0:n]

def getRecommendations(prefs, person,similarity=sim_pearson):
    totals={}
    simSums={}
    for other in prefs:
        if other==person: continue
        sim=similarity(prefs,person,other)
        
        if sim<=0: continue
        for item in prefs[other]:
            if item not in prefs[person] or prefs[person][item]==0:
                totals.setdefault(item,0)
                totals[item]+=prefs[other][item]*sim
                
                simSums.setdefault(item,0)
                simSums[item]+=sim
    rankings = [(total/simSums[item],item) for item,total in totals.items()]
    rankings.sort()
    rankings.reverse()
    return rankings
        
        

    