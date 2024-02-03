![](https://repository-images.githubusercontent.com/470124242/8a45d49c-74da-4a70-a190-03046d1691ea)

- 06.01.24 Автор инструмента вернулся, проект вновь ожил :)
- Рекомендуется прочитать инструкции по работе программы. 
- Вопросы можете задать на дискорд сервере в соответствующей категории.
- Этот файл можно открыть в программе по команде "help" / "h"

------------------------
WoTB CSM - Файл помощи

Актуально на момент версии 2.0.8

------------------------
### [Скачать WoTB CSM](https://github.com/N3M1X10/WoTB-Cluster-Settings-Menu/releases)
### [Руководство по Программе для проверки кластеров](https://github.com/N3M1X10/WoTB-Cluster-Settings-Menu/blob/main/Entire%20Cluster%20Checker.md)
------------------------

### Краткое описание программы
WoT:Blitz RUS Cluster Settings - Меню настройки кластеров СНГ сервера игры Tanks Blitz.
В программе вы можете создать правила в брандмауэр, которые заблокируют исходящее подключение к серверу игры.
А после открыть подключение только к определённому кластеру СНГ сервера игры.
Таким образом можно выбрать кластер на котором вы будете играть.

---------------------------------------------------------------------------------------------------------------

### После обновления программы
После обновления программы, а лучше перед ним, на новую версию мини-обновления* просьба удалить правила клаcтеров(команда - "del")
И создать их снова(команда - "create").
Это делается для того чтобы обновить актуальные ip-адреса вписанные в правила брандмауэра.

---------------------------------------------------------------------------------------------------------------

### Первым делом
1) Запускаем программу "WoTB_Cluster_Settings_Menu.exe" от имени администратора.
2) Перед началом работы обязательно пропишите команду "create" без кавычек. И подтвердите действие буквой "Y".
- Эта команда необходима для блокировки кластеров.
- Она создаёт правила в брандмауэре Windows и автоматически блокирует все кластера.
- !!! Это значит что вы не сможете зайти в игру пока не выберете кластеры на которых будете играть !!!
См. Настройка кластеров

---------------------------------------------------------------------------------------------------------------

### Настройка кластеров
1) Для того чтобы выбрать кластер, введите соответствующую команду для разблокировки нужного вам кластера.
Например: "unblock0" или "ub0" - чтобы можно было зайти на RU_C0.
А если надоел RU_C0 то блокируем его: "block0" или короткой командой: "b0".

2) Также если не уверены в том какие кластера заблокированы а какие нет введите: "block" или "block-all"
- В таком случае заблокируются все кластера и вы сможете точно выбрать нужные вам кластера через команду - 
"unblock<номер кластера>".
Если потребуется разблокировать все кластера без удаления правил, введите команду: "unblock" или "unblock-all", "ub".

- На случай если нужно удалить правила из брандмауэра(обычно после обновления программы), команда: "del" или "delete"
которая удалит все созданные этой программой правила в брандмауэре.

---------------------------------------------------------------------------------------------------------------

### Примечания
- После блокировки кластеров и выбора вам нужного/нужных - скорее всего игра сразу не даст войти на кластер(-а), который(-е) вы выбрали, но спустя несколько попыток переподключения должно заработать.
Такое происходит из-за того - что игра до последнего стучится на тот кластер, который считает оптимальным выбором на данный момент.
Если после долгих попыток подключиться игра не пускает - убедитесь что блокируются не все кластера в Windows Firewall, команда "wf" -> Исходящие правила.

---------------------------------------------------------------------------------------------------------------

### Обратная связь
Связь пользователей с разработчиком совершается только через дискорд-сервер "NECRO"! 
Попасть на сервер можно по ссылке: https://discord.gg/2jJ3Qn4
Если найдёте баги или возникнут дополнительные вопросы - обязательно задайте вопрос на дискорд-сервере в категории "[CSM] - Обратная связь" в канал #обсуждения

---------------------------------------------------------------------------------------------------------------

### Поддержка
При желании, если хотите поддержать автора - в окне консоли можно ввести команды "nemix", "boosty", чтобы перейти на Boosty автора программы.

---------------------------------------------------------------------------------------------------------------
