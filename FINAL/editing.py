import pandas as pd
import numpy as  np 
'''
Our date datas did not fit the date format of mysql.
Our date datas format is = DD-MM-YY
Mysql date format is = YYYY-MM-DD
We used this code to convert mysql date format.
'''

'''Take datas as a dataframe.'''
df = pd.read_csv("PositionHistory.csv")

'''open files'''
flHire = open("HireDates.txt",'w')
flTerminate = open("TerminateDates.txt",'w')
flDob = open("DateOfBirth.txt",'w')
flLprd = open("LPRD.txt",'w')



'''Traverse into the selected column.'''
for date in df["Hire"]:
    #print(type(date))   The type of data is string we can use string functions.
    
    
    '''Don't change the MM value since it is in the right place.'''    
    first = date[:2]     #DD
    last = date[-2:]     #YY


    first ,last= last,first    # switch first(DD) and last(YY)

    date1 = date
    date1 = date.replace(date[:2],first)
    date = date.replace(date[-2:],last)


    lastDate = date1[:6] + date[-2:]    #Concatenate these two date.
    lastDate = "20"+lastDate            #All of the years grater than 2000 so we just put twenty in front of the date.
    flHire.write(lastDate + '\n')              #We take dates from these txt file and put the excel sheet.



'''The same thing but there is NaN values(Not a Number)
   The type of the NaN value is float.
   But we need to string and we eliminate them.
'''

for date in df["Terminate"]:
    if isinstance(date,str): # If it is string we update.
        first = date[:2]
        last = date[-2:]
        first ,last= last,first
        date1 = date
        lastDate = date1[:6] + date[-2:]
        lastDate = "20"+lastDate
        date = lastDate
    flTerminate.write(str(date) + '\n')             #We take dates from these txt file and put the excel sheet.#



df1 = pd.read_csv("EmployeeSon.csv")

'''Do the same thing of the above codes  '''
for date in df1["Dob"]:

    first = date[:2]
    last = date[-2:]


    first ,last= last,first

    date1 = date
    date1 = date.replace(date[:2],first)
    date = date.replace(date[-2:],last)


    lastDate = date1[:6] + date[-2:]
    lastDate = "19"+lastDate #The all years between 1900 and 2000 so we put 19 in front of the dates. 

    flDob.write(lastDate + '\n')           #We take dates from these txt file and put the excel sheet.




for date in df1["LPRD"]:
    if isinstance(date,str):
        first = date[:2]
        last = date[-2:]
        first ,last= last,first
        date1 = date
        date1 = date.replace(date[:2],first)
        date = date.replace(date[-2:],last)
        lastDate = date1[:6] + date[-2:]
        lastDate = "20"+lastDate             #All of the years grater than 2000 so we just put twenty in front of the date.
        date = lastDate
    flLprd.write(str(date) + '\n')                      #We take dates from these txt file and put the excel sheet.
