import os
currentPath = os.getcwd()
print(currentPath)
os.chdir('E:\hello-git-sourcetree\\R_GO\\Python_RPA')

from openpyxl import load_workbook

xlsx = load_workbook("수강생_결제정보.xlsx", read_only =True)
sheet=xlsx.active
