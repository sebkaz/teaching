library("RSQLite")

sterownik <- dbDriver("SQLite")
polaczenie <- dbConnect(sterownik, "zabawka.db")



dbExecute(polaczenie, "Create table test ('id', 'test1', 'test2') ")
dbExecute(polaczenie, "insert into test values (1,2,3),(2,6,4)")

dbListTables(polaczenie)
dbListFields(polaczenie, "test")

ludzie <- dbGetQuery(polaczenie, "Select * from FamousPeople")

testowy <- dbGetQuery(polaczenie, "select * from test")