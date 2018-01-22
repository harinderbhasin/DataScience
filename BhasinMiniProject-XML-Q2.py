# Mini Project 4
# Name: Harry Bhasin in collaboration with Peter B.
# Question 1

import pandas as pd
import xml.etree.ElementTree as ET
# import statistics
# from statistics import mean
import numpy as np

# read xml file into Python
filename='baseball_salaries_2003.xml'
root = ET.parse(filename).getroot()


# seperate data into positions
catcher = [playerdata for playerdata in root.findall('playerdata') if playerdata.findtext('Position') == ' Catcher']
firstbase = [playerdata for playerdata in root.findall('playerdata') if playerdata.findtext('Position') == ' First Baseman']
outfielder = [playerdata for playerdata in root.findall('playerdata') if playerdata.findtext('Position') == ' Outfielder']
pitcher = [playerdata for playerdata in root.findall('playerdata') if playerdata.findtext('Position') == ' Pitcher']
secondbase = [playerdata for playerdata in root.findall('playerdata') if playerdata.findtext('Position') == ' Second Baseman']
shortstop = [playerdata for playerdata in root.findall('playerdata') if playerdata.findtext('Position') == ' Shortstop']
thirdbase = [playerdata for playerdata in root.findall('playerdata') if playerdata.findtext('Position') == ' Third Baseman']

# define a function to determine the mean salary for each position
def avg_salary(position, filename):
    salaryvector = []
    for playerdata in filename:
        salary = int(playerdata.findtext('Salary'))
        salaryvector.append(salary)
    avgsal = np.mean(salaryvector)
    res = [position, round(avgsal,2)]
    return res
#    print position, round(avgsal,2)
#    return avgsal


# run the function for each position and sort it out
# np.sort([['outfielder', avg_salary('outfielder',outfielder)],
#    ['firstbase', avg_salary('firstbase',firstbase)],
#    ['shortstop', avg_salary('shortstop',shortstop)],
#    ['thirdbase', avg_salary('thirdbase',thirdbase)],
#    ['pitcher', avg_salary('pitcher',pitcher)],
#    ['secondbase', avg_salary('secondbase',secondbase)],
#    ['catcher', avg_salary('catcher',catcher)]])


# run the function for each position
a = avg_salary('catcher',catcher)
b = avg_salary('firstbase',firstbase)
c = avg_salary('outfielder',outfielder)
d = avg_salary('pitcher',pitcher)
e = avg_salary('secondbase',secondbase)
f = avg_salary('shortstop',shortstop)
g = avg_salary('thirdbase',thirdbase)

# put results into datafram and sort by descending order of salary
df = pd.DataFrame([[a[0], a[1]], [b[0],b[1]], [c[0],c[1]], [d[0],d[1]], [e[0],e[1]], [f[0],f[1]], [g[0],g[1]]], columns=['Position','Salary'])
df.sort(['Salary'], ascending=[False])

