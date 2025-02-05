@echo off
chcp 65001>nul

:: Source: https://github.com/N3M1X10/wotb-csm

set "arg=%1"
if "%arg%" == "admin" (
title wotb-csm (admin^)
) else (
    powershell -Command "Start-Process 'cmd.exe' -ArgumentList '/k \"\"%~f0\" admin\"' -Verb RunAs"
    exit /b
)

setlocal
echo [101;93mМеню настройки кластеров СНГ сервера Tanks Blitz[0m
echo [33mВыберите команду:[0m
echo [96m[   ^<команда^> ^| ^<описание^>   ][0m
echo [96m[ b0 - Блокировать RU_C0     ][0m
echo [96m[ b1 - Блокировать RU_C1     ][0m
echo [96m[ b2 - Блокировать RU_C2     ][0m
echo [96m[ b3 - Блокировать RU_C3     ][0m
echo [96m[ b4 - Блокировать RU_C4     ][0m
echo [96m[ b5 - Блокировать RU_C5     ][0m
echo [96m[ ub0 - Разблокировать RU_C0 ][0m
echo [96m[ ub1 - Разблокировать RU_C1 ][0m
echo [96m[ ub2 - Разблокировать RU_C2 ][0m
echo [96m[ ub3 - Разблокировать RU_C3 ][0m
echo [96m[ ub4 - Разблокировать RU_C4 ][0m
echo [96m[ ub5 - Разблокировать RU_C5 ][0m
echo [33mДругие опции:[0m
echo [96m[     ^<команда^> ^| ^<описание^>                                         ][0m
echo [96m[ c / create    - Создать правила для контролирования кластеров      ][0m
echo [96m[ del / delete  - Удалить все правила для контролирования кластеров  ][0m
echo [96m[ b / block     - Заблокировать все кластера                         ][0m
echo [96m[ ub / unblock  - Разблокировать все кластера                        ][0m
echo [96m[ сс / check    - Открыть батник для проверки связи с кластерами     ][0m
echo [96m[ wf / firewall - Открыть монитор Windows Defender     ][0m
echo [96m[ add / rem     - Добавить/Удалить в иключения Windows Defender      ][0m
echo [96m[ h / help      - Перейти на страницу GitHub                         ][0m
echo [96m[ r / restart   - [33mПерезапустить этот пакет[0m [96m                          ][0m
echo [96m[ x / close     -[0m [31mЗавершить работу [0m[96m                                  ][0m[0m

::
:: Options
::

set pls-enter-comm=[31m[      Пожалуйста, введите команду      ][0m
set incorrect-command=[31m[   Некорректная команда   ][0m
set clast-rls-nf=[31m[ ОШИБКА ]: Правило кластера не найдено, пожалуйста введите: "c" или "create"[0m
set clasters-rls-nf=[31m[ ОШИБКА ]: Правила кластеров не найдены, пожалуйста введите: "c" или "create"[0m
set usercommandcolor=[0m


:func
::Вопрос от функции
set /p a= "[92mВвод:%usercommandcolor% "

::            firewall builder
if "%a%"=="create" goto create
if "%a%"=="c"      goto create

if "%a%"=="e"      goto exclusions

if "%a%"=="del"    goto rules-del
if "%a%"=="delete" goto rules-del

::blockers trackers
if "%a%"=="block" goto block-all
if "%a%"=="b"     goto block-all

if "%a%"=="b0"     goto block0
if "%a%"=="b1"     goto block1
if "%a%"=="b2"     goto block2
if "%a%"=="b3"     goto block3
if "%a%"=="b4"     goto block4
if "%a%"=="b5"     goto block5

::unblockers trackers
if "%a%"=="unblock" goto unblock-all
if "%a%"=="ub"      goto unblock-all

if "%a%"=="ub0"      goto unblock0
if "%a%"=="ub1"      goto unblock1
if "%a%"=="ub2"      goto unblock2
if "%a%"=="ub3"      goto unblock3
if "%a%"=="ub4"      goto unblock4
if "%a%"=="ub5"      goto unblock5

::controls trackers
::             close program
if "%a%"=="x"     goto end
if "%a%"=="close" goto end
if "%a%"=="end"   goto end

::   restart program inside this window
if "%a%"=="r"       goto restart
if "%a%"=="restart" goto restart

:: open github
if "%a%"=="h"      goto github
if "%a%"=="help"   goto github

::   open cluster checker
if "%a%"=="cc"    goto openclusterchecker
if "%a%"=="check" goto openclusterchecker

::   open Windows Firewall
if "%a%"=="wf"               goto :wf
if "%a%"=="firewall"         goto :wf

::ADD-PROGRAM-TO-EXCLUSIONS tool
if "%a%"=="add" goto addtoexclusions
if "%a%"=="rem"    goto removefromexclusions

::	Если команда пустая
if "%a%"=="" goto command-missing

::	Если команда не распознана
Echo %incorrect-command%
goto func

:command-missing
Echo %pls-enter-comm%
goto func


:::::::::::::::::::::::::::::::::
::Создание правил в брандмауэре::
:::::::::::::::::::::::::::::::::
:create
set a=
set create-confirmation=
Set /p create-confirmation="[92mПодтвердите создание правил в брандмауэре [ y / n ]: %usercommandcolor%"

if "%create-confirmation%"=="y" goto create-y
if "%create-confirmation%"=="Y" goto create-y
if "%create-confirmation%"=="n" goto create-n
if "%create-confirmation%"=="N" goto create-n

Echo %incorrect-command%

goto func

:create-y
echo.
set cldesc="Правило для блокирования СНГ кластеров в World of Tanks: Blitz. (Created in WoTB CSM by NEMIX)"
netsh advfirewall firewall add rule name="WoTB RU_C0 Block" description=%cldesc% protocol=any action=block dir=out remoteip=92.223.6.70-92.223.6.90
netsh advfirewall firewall add rule name="WoTB RU_C1 Block" description=%cldesc% protocol=any action=block dir=out remoteip=92.223.33.38-92.223.33.88
netsh advfirewall firewall add rule name="WoTB RU_C2 Block" description=%cldesc% protocol=any action=block dir=out remoteip=92.223.14.214-92.223.14.225
netsh advfirewall firewall add rule name="WoTB RU_C3 Block" description=%cldesc% protocol=any action=block dir=out remoteip=92.38.156.9-92.38.156.191
netsh advfirewall firewall add rule name="WoTB RU_C4 Block" description=%cldesc% protocol=any action=block dir=out remoteip=92.223.4.178-92.223.4.191
netsh advfirewall firewall add rule name="WoTB RU_C5 Block" description=%cldesc% protocol=any action=block dir=out remoteip=92.223.41.33-92.223.41.195
echo [92mПравила брандмауэра созданы![0m
goto func

:create-n
echo [31m[         СОЗДАНИЕ ПРАВИЛ ОТКЛОНЕНО         ][0m
goto func



:::::::::::::::::::::::::::::::::
::Удаление правил в брандмауэре::
:::::::::::::::::::::::::::::::::
:rules-del
set a=
set ask=
Set /p ask="[33mПодтвердите удаление правил в брандмауэре [ y / n ]: %usercommandcolor%"

if "%ask%"=="y" goto rules-del-y
if "%ask%"=="Y" goto rules-del-y
if "%ask%"=="n" goto rules-del-n
if "%ask%"=="N" goto rules-del-n

set ask=
Echo %incorrect-command%
goto func

:rules-del-y
netsh advfirewall firewall delete rule name="WoTB RU_C0 Block"
netsh advfirewall firewall delete rule name="WoTB RU_C1 Block"
netsh advfirewall firewall delete rule name="WoTB RU_C2 Block"
netsh advfirewall firewall delete rule name="WoTB RU_C3 Block"
netsh advfirewall firewall delete rule name="WoTB RU_C4 Block"
netsh advfirewall firewall delete rule name="WoTB RU_C5 Block"
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clasters-rls-nf%
echo.
goto func
)
echo [92m[   Правила в брандмауэре удалены!   ][0m
goto func

:rules-del-n
echo [31m[   УДАЛЕНИЕ ОТКЛОНЕНО   ][0mx
goto func

::blockers
:block-all
set a=
netsh advfirewall firewall set rule name="WoTB RU_C0 Block" new enable=yes
netsh advfirewall firewall set rule name="WoTB RU_C1 Block" new enable=yes
netsh advfirewall firewall set rule name="WoTB RU_C2 Block" new enable=yes
netsh advfirewall firewall set rule name="WoTB RU_C3 Block" new enable=yes
netsh advfirewall firewall set rule name="WoTB RU_C4 Block" new enable=yes
netsh advfirewall firewall set rule name="WoTB RU_C5 Block" new enable=yes
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clasters-rls-nf%
echo.
goto func
)
echo [92mВсе кластера заблокированы![0m
goto func


:block0
netsh advfirewall firewall set rule name="WoTB RU_C0 Block" new enable=yes
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clast-rls-nf%
echo.
goto func
)
echo [92mКластер [96mRU_C0[92m Заблокирован![0m
echo.
goto func


:block1
netsh advfirewall firewall set rule name="WoTB RU_C1 Block" new enable=yes
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clast-rls-nf%
echo.
goto func
)
echo [92mКластер [96mRU_C1[92m Заблокирован![0m
echo.
goto func


:block2
netsh advfirewall firewall set rule name="WoTB RU_C2 Block" new enable=yes
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clast-rls-nf%
echo.
goto func
)
echo [92mКластер [96mRU_C2[92m Заблокирован![0m
echo.
goto func


:block3
netsh advfirewall firewall set rule name="WoTB RU_C3 Block" new enable=yes
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clast-rls-nf%
echo.
goto func
)
echo [92mКластер [96mRU_C3[92m Заблокирован![0m
echo.
goto func


:block4
netsh advfirewall firewall set rule name="WoTB RU_C4 Block" new enable=yes
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clast-rls-nf%
echo.
goto func
)
echo [92mКластер [96mRU_C4[92m Заблокирован![0m
echo.
goto func


:block5
netsh advfirewall firewall set rule name="WoTB RU_C5 Block" new enable=yes
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clast-rls-nf%
echo.
goto func
)
echo [92mКластер [96mRU_C5[92m Заблокирован![0m
echo.
goto func


::unblockers
:unblock-all
netsh advfirewall firewall set rule name="WoTB RU_C0 Block" new enable=no
netsh advfirewall firewall set rule name="WoTB RU_C1 Block" new enable=no
netsh advfirewall firewall set rule name="WoTB RU_C2 Block" new enable=no
netsh advfirewall firewall set rule name="WoTB RU_C3 Block" new enable=no
netsh advfirewall firewall set rule name="WoTB RU_C4 Block" new enable=no
netsh advfirewall firewall set rule name="WoTB RU_C5 Block" new enable=no
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clasters-rls-nf%
echo.
goto func
)
echo [92mВсе кластера разблокированы![0m
goto func


:unblock0
netsh advfirewall firewall set rule name="WoTB RU_C0 Block" new enable=no
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clast-rls-nf%
echo.
goto func
)
echo [92mКластер [96mRU_C0[92m Разблокирован![0m
echo.
goto func


:unblock1
netsh advfirewall firewall set rule name="WoTB RU_C1 Block" new enable=no
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clast-rls-nf%
echo.
goto func
)
echo [92mКластер [96mRU_C1[92m Разблокирован![0m
echo.
goto func


:unblock2
netsh advfirewall firewall set rule name="WoTB RU_C2 Block" new enable=no
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clast-rls-nf%
echo.
goto func
)
echo [92mКластер [96mRU_C2[92m Разблокирован![0m
echo.
goto func

:unblock3
netsh advfirewall firewall set rule name="WoTB RU_C3 Block" new enable=no
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clast-rls-nf%
echo.
goto func
)
echo [92mКластер [96mRU_C3[92m Разблокирован![0m
echo.
goto func

:unblock4
netsh advfirewall firewall set rule name="WoTB RU_C4 Block" new enable=no
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clast-rls-nf%
echo.
goto func
)
echo [92mКластер [96mRU_C4[92m Разблокирован![0m
echo.
goto func

:unblock5
netsh advfirewall firewall set rule name="WoTB RU_C5 Block" new enable=no
::check errors with previvous command
IF %ERRORLEVEL% NEQ 0 (
Echo %clast-rls-nf%
echo.
goto func
)
echo [92mКластер [96mRU_C5[92m Разблокирован![0m
echo.
goto func

:restart
endlocal
cmd /c "%~f0" :
exit

:wf
Echo [33m[      Запуск Windows Firewall ...      ][0m
start WF.msc
Echo [92m[       Windows Firewall Запущен!       ][0m
goto func

:github
echo [96m ! github
explorer "https://github.com/N3M1X10/wotb-csm"
goto func

::ADD TO EXCLUSIONS TOOL::
:addtoexclusions
powershell Add-MpPreference -ExclusionProcess "%~xn0"
if %ERRORLEVEL% neq 0 (
echo [31mОшибка[0m
) else (
echo [96m%~xn0[92m добавлен в исключения Windows Defender![0m
)
goto func

:removefromexclusions
powershell Remove-MpPreference -ExclusionProcess "%~xn0"
echo [96m%~xn0[92m удалён из исключений Windows Defender!
goto func

:openclusterchecker
set checkername=cluster-checker.bat
start "" "%checkername%"
IF %ERRORLEVEL% NEQ 0 (
echo [31m[ Не удаётся запустить [96m%checkername%[31m ][0m
echo.
goto func
)
echo [96m! %checkername%[0m
goto func

:end
endlocal
exit
