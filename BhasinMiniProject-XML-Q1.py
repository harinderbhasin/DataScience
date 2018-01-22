# Mini Project 4
# Name: Harry Bhasin in collaboration with Peter B.
# Question 1

import pandas as pd
import xml.etree.ElementTree as ET
# import statistics
# from statistics import mean
import numpy as np
# read the player data text file into a python dataframe using panda
playerdata=pd.read_csv('baseball_salaries_2003.txt', sep=":", skiprows=3, names=('Team','Player','Salary','Position'))

# define a function that converts the dataframe to xml and writes to a xml file
def df_to_xml(df, filename=None, mode='w'):
    def row_to_xml(row):
        xml = ['  <playerdata>']
        for i, col_name in enumerate(row.index):
            xml.append('    <{0}>{1}</{0}>'.format(col_name, row.iloc[i]))
        xml.append('  </playerdata>')
        return '\n'.join(xml)
    res = '<?xml version="1.0" encoding="UTF-8"?>\n<baseball>\n' + '\n'.join(df.apply(row_to_xml, axis=1)) + '\n</baseball>'

    if filename is None:
        return res
    with open(filename, mode) as f:
        f.write(res)

# execute the function on the dataframe 'playerdata', with output file 'baseball_salaries_2003.xml'
df_to_xml(playerdata,'baseball_salaries_2003.xml')

