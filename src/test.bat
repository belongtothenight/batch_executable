@echo off
setlocal enabledelayedexpansion

rem Create the array via elements placed in a FOR command
rem at same time, generate the counter:
set counter=0
for %%a in (Base1 Base2 Base3 Base4 Base5 Base6) do (
   set Base_list[!counter!]=%%a
   set /A counter+=1
)

rem Adjust the counter because the array is zero-based:
set /A counter-=1

set Current_Node=Node1

if "%Current_Node%" == "Node1" (
   for /l %%a in (0 , 1, %counter%) do (
   rem do some stuff
   echo Element %%a in Base_list array is: !Base_list[%%a]!
   )
)