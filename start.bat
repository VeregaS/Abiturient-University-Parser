@echo off
set VENV_PATH=PATH TO YOUR PYTHON HERE (only folder)
chcp 65001

:main
cls
echo Добро пожаловать!
echo.
echo Выбор:
echo [1] ГУАП
echo [2] СПбПУ
echo.
echo [99] Выход
set /p ans="Ввод: "

if %ans%==1 (
    goto GUAP_main
)
if %ans%==2 (
    goto PU_main
)
if %ans%==99 (
    cls
    exit
)
else (
    goto main
)

::-----------------------------------------------------------------------------------
::-----------------------------------------------------------------------------------
::-----------------------------------------------------------------------------------
::-----------------------------------------------------------------------------------
::-----------------------------------------------------------------------------------

:GUAP_main
cls
echo ГУАП
echo.
echo Выбор:
echo [1] 27.03.05 Инноватика
echo [2] 09.03.04 Программная инженерия
echo [3] 09.03.02 Информационные системы и технологии
echo [4] 27.03.04 Управление в технических системах
echo [5] 09.03.03 Прикладная информатика (институт 4)
echo [6] 01.03.02 Прикладная математика и информатика
echo [7] 09.03.01 Информатика и вычислительная техника (институт 4)
echo [8] 09.03.01 Информатика и вычислительная техника (институт 1)
echo [9] 10.03.01 Информационная безопасность
echo.
echo [99] Назад
set /p ans="Ввод: "

if %ans%==1 (
    goto GUAP_list_27.03.05
) 
if %ans%==2 (
    goto GUAP_list_09.03.04
)
if %ans%==3 (
    goto GUAP_list_09.03.02
) 
if %ans%==4 (
    goto GUAP_list_27.03.04
)
if %ans%==5 (
    goto GUAP_list_09.03.03
)
if %ans%==6 (
    goto GUAP_list_01.03.02
)
if %ans%==7 (
    goto GUAP_list_09.03.01a
) 
if %ans%==8 (
    goto GUAP_list_09.03.01b
) 
if %ans%==9 (
    goto GUAP_list_10.03.01
) 
if %ans%==99 (
    goto main
)
else (
    goto GUAP_main
)


:GUAP_list_10.03.01
cls
echo ГУАП 
echo 10.03.01 Информационная безопасность
echo.
set uni=ГУАП
set spec=10.03.01
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto GUAP_main
)
else (
    goto GUAP_list_10.03.01
)

:GUAP_list_09.03.01b
cls
echo ГУАП 
echo 09.03.01 Информатика и вычислительная техника (институт 1)
echo.
set uni=ГУАП
set spec=09.03.01b
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto GUAP_main
)
else (
    goto GUAP_list_09.03.01b
)

:GUAP_list_09.03.01a
cls
echo ГУАП 
echo 09.03.01 Информатика и вычислительная техника (институт 4)
echo.
set uni=ГУАП
set spec=09.03.01a
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto GUAP_main
)
else (
    goto GUAP_list_09.03.01a
)

:GUAP_list_01.03.02
cls
echo ГУАП 
echo 01.03.02 Прикладная математика и информатика
echo.
set uni=ГУАП
set spec=01.03.02
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto GUAP_main
)
else (
    goto GUAP_list_01.03.02
)

:GUAP_list_09.03.03
cls
echo ГУАП 
echo 09.03.03 Прикладная информатика (институт 4)
echo.
set uni=ГУАП
set spec=09.03.03
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto GUAP_main
)
else (
    goto GUAP_list_09.03.03
)

:GUAP_list_27.03.05
cls
echo ГУАП 
echo 27.03.05 Инноватика
echo.
set uni=ГУАП
set spec=27.03.05
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto GUAP_main
)
else (
    goto GUAP_list_27.03.05
)

:GUAP_list_09.03.04
cls
echo ГУАП 
echo 09.03.04 Программная инженерия
echo.
set uni=ГУАП
set spec=09.03.04
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto GUAP_main
)
else (
    goto GUAP_list_09.03.04
)

:GUAP_list_09.03.02
cls
echo ГУАП 
echo 09.03.02 Информационные системы и технологии
echo.
set uni=ГУАП
set spec=09.03.02
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto GUAP_main
)
else (
    goto GUAP_list_09.03.02
)

:GUAP_list_27.03.04
cls
echo ГУАП 
echo 27.03.04 Управление в технических системах
echo.
set uni=ГУАП
set spec=27.03.04
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto GUAP_main
)
else (
    goto GUAP_list_27.03.04
)

::-----------------------------------------------------------------------------------
::-----------------------------------------------------------------------------------
::-----------------------------------------------------------------------------------
::-----------------------------------------------------------------------------------
::-----------------------------------------------------------------------------------



:PU_main
cls
echo СПбПУ
echo.
echo Выбор:
echo [1] 38.03.05 Бизнес-информатика
echo [2] 27.03.05 Инноватика
echo [3] 27.03.04 Управление в технических системах
echo [4] 15.03.04 Автоматизация технологических процессов и производств
echo [5] 01.03.05 Статистика
echo [6] 10.05.01 Компьютерная безопасность
echo [7] 10.05.03 Информационная безопасность автоматизированных систем
echo [8] 10.05.04 Информационно-аналитические системы безопасности
echo.
echo [99] Назад
set /p ans="Ввод: "

if %ans%==1 (
    goto PU_list_38.03.05
) 
if %ans%==2 (
    goto PU_list_27.03.05
)
if %ans%==3 (
    goto PU_list_27.03.04
) 
if %ans%==4 (
    goto PU_list_15.03.04
)
if %ans%==5 (
    goto PU_list_01.03.05
)
if %ans%==6 (
    goto PU_list_10.05.01
) 
if %ans%==7 (
    goto PU_list_10.05.03
) 
if %ans%==8 (
    goto PU_list_10.05.04 
) 
if %ans%==99 (
    goto main
)
else (
    goto PU_main
)

:PU_list_10.05.04 
cls
echo СПбПУ
echo 10.05.04 Информационно-аналитические системы безопасности
echo.
set uni=СПбПУ
set spec=10.05.04 
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto PU_main
)
else (
    goto PU_list_10.05.04 
)

:PU_list_10.05.03
cls
echo СПбПУ
echo 10.05.03 Информационная безопасность автоматизированных систем
echo.
set uni=СПбПУ
set spec=10.05.03
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto PU_main
)
else (
    goto PU_list_10.05.03
)

:PU_list_10.05.01
cls
echo СПбПУ
echo 10.05.01 Компьютерная безопасность
echo.
set uni=СПбПУ
set spec=10.05.01
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto PU_main
)
else (
    goto PU_list_10.05.01
)

:PU_list_01.03.05
cls
echo СПбПУ
echo 01.03.05 Статистика
echo.
set uni=СПбПУ
set spec=01.03.05
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto PU_main
)
else (
    goto PU_list_01.03.05
)

:PU_list_38.03.05
cls
echo СПбПУ
echo 38.03.05 Бизнес-информатика
echo.
set uni=СПбПУ
set spec=38.03.05
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto PU_main
)
else (
    goto PU_list_38.03.05
)

:PU_list_27.03.05
cls
echo СПбПУ
echo 27.03.05 Инноватика
echo.
set uni=СПбПУ
set spec=27.03.05
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto PU_main
)
else (
    goto PU_list_27.03.05
)

:PU_list_27.03.04
cls
echo СПбПУ
echo 27.03.04 Управление в технических системах
echo.
set uni=СПбПУ
set spec=27.03.04
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto PU_main
)
else (
    goto PU_list_27.03.04
)

:PU_list_15.03.04
cls
echo СПбПУ
echo 15.03.04 Автоматизация технологических процессов и производств
echo.
set uni=СПбПУ
set spec=15.03.04
python main.py %uni %spec %VAR_1% ^> Output
SET /p List=<Output
ECHO %List%
echo.
echo [99] Назад
set /p ans="Ввод: "
if %ans%==99 (
    goto PU_main
)
else (
    goto PU_list_15.03.04
)