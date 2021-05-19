SET SEARCH_PATH = db_project;

create table if not exists
    dormitory (
        id      smallint primary key
        , name  varchar(20) not null
);

create table if not exists
    student (
        id              integer primary key
        , dormitory_id  smallint references dormitory(id)
        , first_name    varchar(50) not null
        , second_name   varchar(50) not null
);

create table if not exists
    room (
        id                 smallint primary key
        , responsible_id   integer references student(id)
        , dormitory_id     smallint references dormitory(id)
        , name             varchar(20) not null
        , description      varchar(200)
);

create table if not exists
   booking_room (
        id                 bigint primary key
        , user_id          integer references student(id)
        , room_id          smallint references room(id)
        , start_time       timestamp not null
        , end_time         timestamp not null
        , creation_time    timestamp not null
);

create table if not exists
   booking_washing_machine (
        id                      bigint primary key
        , user_id               integer references student(id)
        , washing_machine_id    smallint references washing_machine(id) on delete cascade
        , start_time            timestamp not null
        , end_time              timestamp not null
        , creation_time         timestamp not null
);

create table if not exists
   washing_machine (
        id                 smallint primary key
        , washing_room_id  smallint references room(id) on delete cascade
        , is_active        bool not null
        , num              smallint not null
);

create table if not exists
   bike (
        id            bigint primary key
        , room_id     smallint references room(id)
        , user_id     integer references  student(id)
        , bike_name   varchar(50) not null
);

create table if not exists
   tool (
        id                 smallint primary key
        , tools_room_id    smallint references room(id)
        , is_active        bool not null
        , name             varchar(50) not null
        , description      varchar(200) not null
);

create table if not exists
   booking_tool (
        id                 bigint primary key
        , tool_id          smallint references tool(id)
        , user_id          integer references student(id)
        , start_time       timestamp not null
        , end_time         timestamp not null
);

INSERT INTO dormitory(id, name) VALUES(0, 'двойка');
INSERT INTO dormitory(id, name) VALUES(1, 'семёрка');

INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(0, 0, 'Константин', 'Драгун');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(1, 0, 'Булат', 'Шелхонов');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(2, 0, 'Лада', 'Шульгина');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(3, 0, 'Алиса', 'Позднякова');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(4, 0, 'Иван', 'Жаров');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(5, 0, 'Павел', 'Субботин');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(6, 0, 'Александр', 'Зименков');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(7, 0, 'Максим', 'Копец');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(8, 0, 'Никита', 'Никитин');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(9, 0, 'Максим', 'Мальцев');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(10, 0, 'Александр', 'Печёнкин');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(11, 0, 'Дмитрий', 'Чупов');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(12, 0, 'Дмитрий', 'Проскурин');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(13, 0, 'Дарья', 'Сверлова');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(14, 0, 'Екатерина', 'Дробченко');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(15, 0, 'Михаил', 'Юманов');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(32, 0, 'Георгий', 'Слепцов');


INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(16, 1, 'Алла', 'Зайцева');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(17, 1, 'Владислав', 'Топоровский');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(18, 1, 'Ксения', 'Слепова');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(19, 1, 'Никита', 'Кубраков');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(20, 1, 'Полина', 'Селина');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(21, 1, 'Тимур', 'Ибраев');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(22, 1, 'Анна', 'Стриж');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(23, 1, 'Андрей', 'Станкевич');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(24, 1, 'Арина', 'Чумаченко');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(25, 1, 'Арлен', 'Джунусов');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(26, 1, 'Юлия', 'Бодрова');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(27, 1, 'София', 'Маланчук');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(28, 1, 'Роман', 'Соловьёв');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(29, 1, 'Лев', 'Нечитайло');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(30, 1, 'Алия', 'Трапезникова');
INSERT INTO student(id, dormitory_id, first_name, second_name) VALUES(31, 1, 'Никита', 'Ставцев');


INSERT INTO room(id, responsible_id, dormitory_id, name, description) VALUES(0, 5, 0, 'Клуб', 'Здесь ' ||
            'можно проводить собрания и мероприятия, не подразумевающие активные действия участников, а ' ||
                                                    'также громкое звуковое сопровождение после 23:00');
INSERT INTO room(id, responsible_id, dormitory_id, name, description) VALUES(1, 5, 0, 'КДС', 'Здесь ' ||
            'можно проводить собрания и мероприятия, не подразумевающие активные действия участников, а ' ||
                                                               'также громкое звуковое сопровождение;');
INSERT INTO room(id, responsible_id, dormitory_id, name, description) VALUES(2, 7, 0, 'Переговорка', 'Здесь ' ||
            'можно проводить собрания и мероприятия, не подразумевающие активные действия участников, а ' ||
                                                                 'также громкое звуковое сопровождение;');
INSERT INTO room(id, responsible_id, dormitory_id, name, description) VALUES(3, 6, 0, 'Стиралка', 'Здесь можно и нужно стирать свои вещи в общественных стиральных машинках;
Здесь можно (но крайне не рекомендуется) сушить свои вещи, если все сушилки на этажах заняты;');
INSERT INTO room(id, responsible_id, dormitory_id, name, description) VALUES(4, 31, 1, 'Стиралка', 'Здесь можно и нужно стирать свои вещи в общественных стиральных машинках;
Здесь можно (но крайне не рекомендуется) сушить свои вещи, если все сушилки на этажах заняты;');
INSERT INTO room(id, responsible_id, dormitory_id, name, description) VALUES(5, 16, 1, 'Клуб', 'Здесь ' ||
            'можно проводить собрания и мероприятия, не подразумевающие активные действия участников, а ' ||
                                                    'также громкое звуковое сопровождение после 23:00');
INSERT INTO room(id, responsible_id, dormitory_id, name, description) VALUES(6, 16, 1, 'КДС', 'Здесь ' ||
            'можно проводить собрания и мероприятия, не подразумевающие активные действия участников, а ' ||
                                                               'также громкое звуковое сопровождение;');
INSERT INTO room(id, responsible_id, dormitory_id, name, description) VALUES(7, 7, 0, 'Игровая', 'Здесь ' ||
            'можно проводить собрания и мероприятия, не подразумевающие учебную деятельность, например играть в настольные игры или игровую приставку;');
INSERT INTO room(id, responsible_id, dormitory_id, name, description) VALUES(8, 4, 0, 'Инструментарий', 'Здесь' ||
            ' студенты ФПМИ могут взять на временное пользование инструменты для проведения ремонтных работ;');

INSERT INTO room(id, responsible_id, dormitory_id, name, description) VALUES(9, 8, 0, 'Велокомната', '');

INSERT INTO tool(id, tools_room_id, is_active, name, description) VALUES(0, 8, true, 'скотч жёлтый', '');
INSERT INTO booking_tool(id, tool_id, user_id, start_time, end_time) VALUES(
                         0, 0, 12, '2021-05-12 12:05:06'::timestamp, '2999-11-30 23:59:59'::timestamp);

INSERT INTO tool(id, tools_room_id, is_active, name, description) VALUES(127, 8, true, 'Бюгель (ручка для валика) 150мм', '');
INSERT INTO tool(id, tools_room_id, is_active, name, description) VALUES(128, 8, true, 'Комплект монтажный лен+паста', 'сантехкреп');

INSERT INTO tool(id, tools_room_id, is_active, name, description) VALUES(123, 8, true, 'скотч синий', '');
INSERT INTO booking_tool(id, tool_id, user_id, start_time, end_time) VALUES(
                         1, 123, 10, '2021-04-02 18:45:33'::timestamp, '2999-11-30 23:59:59'::timestamp);

INSERT INTO bike(id, room_id, user_id, bike_name) VALUES(124, 9, 10, 'Ghost Square Cross 4.8');
INSERT INTO bike(id, room_id, user_id, bike_name) VALUES(125, 9, 3, 'Diamondback Haanjenn 3');
INSERT INTO bike(id, room_id, user_id, bike_name) VALUES(126, 9, 6, 'Tommaso Imola');

INSERT INTO washing_machine(id, washing_room_id, is_active, num) VALUES(500, 3, false, 1);
INSERT INTO washing_machine(id, washing_room_id, is_active, num) VALUES(501, 3, true, 5);
INSERT INTO washing_machine(id, washing_room_id, is_active, num) VALUES(502, 3, true, 4);
INSERT INTO washing_machine(id, washing_room_id, is_active, num) VALUES(503, 3, true, 3);
INSERT INTO washing_machine(id, washing_room_id, is_active, num) VALUES(504, 3, true, 2);

INSERT INTO washing_machine(id, washing_room_id, is_active, num) VALUES(509, 4, true, 1);
INSERT INTO washing_machine(id, washing_room_id, is_active, num) VALUES(506, 4, true, 2);
INSERT INTO washing_machine(id, washing_room_id, is_active, num) VALUES(507, 4, true, 3);
INSERT INTO washing_machine(id, washing_room_id, is_active, num) VALUES(508, 4, true, 4);

INSERT INTO booking_washing_machine(id, user_id, washing_machine_id, start_time, end_time, creation_time) VALUES(1000, 0, 501,
                '2021-05-18 18:00:00'::timestamp, '2021-05-18 21:00:00'::timestamp, '2021-05-16 16:32:01'::timestamp);

INSERT INTO booking_washing_machine(id, user_id, washing_machine_id, start_time, end_time, creation_time) VALUES(1001, 1, 504,
                '2021-05-18 21:00:00'::timestamp, '2021-05-19 00:00:00'::timestamp, '2021-05-16 14:18:21'::timestamp);

INSERT INTO booking_washing_machine(id, user_id, washing_machine_id, start_time, end_time, creation_time) VALUES(1002, 2, 504,
                '2021-05-18 18:00:00'::timestamp, '2021-05-18 21:00:00'::timestamp, '2021-05-17 23:54:17'::timestamp);

INSERT INTO booking_washing_machine(id, user_id, washing_machine_id, start_time, end_time, creation_time) VALUES(1003, 13, 503,
                '2021-05-20 12:00:00'::timestamp, '2021-05-20 18:00:00'::timestamp, '2021-05-15 10:45:06'::timestamp);

INSERT INTO booking_washing_machine(id, user_id, washing_machine_id, start_time, end_time, creation_time) VALUES(1004, 14, 503,
                '2021-05-20 9:00:00'::timestamp, '2021-05-20 12:00:00'::timestamp, '2021-05-19 19:02:58'::timestamp);

INSERT INTO booking_washing_machine(id, user_id, washing_machine_id, start_time, end_time, creation_time) VALUES(1005, 8, 502,
                '2021-05-20 9:00:00'::timestamp, '2021-05-20 12:00:00'::timestamp, '2021-05-16 22:43:29'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1006, 11, 0,
                '2021-05-18 22:00:00'::timestamp, '2021-05-19 02:00:00'::timestamp, '2021-05-14 21:42:01'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1007, 11, 0,
                '2021-05-20 22:00:00'::timestamp, '2021-05-21 02:00:00'::timestamp, '2021-05-14 21:44:15'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1008, 11, 0,
                '2021-05-22 22:00:00'::timestamp, '2021-05-23 02:00:00'::timestamp, '2021-05-14 21:47:34'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1009, 9, 0,
                '2021-05-18 9:30:00'::timestamp, '2021-05-18 12:00:00'::timestamp, '2021-05-16 02:13:50'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1011, 3, 0,
                '2021-05-18 01:10:00'::timestamp, '2021-05-18 5:10:00'::timestamp, '2021-05-15 03:56:49'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1010, 3, 0,
                '2021-05-18 5:30:00'::timestamp, '2021-05-18 9:00:00'::timestamp, '2021-05-18 05:09:27'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1012, 32, 0,
                '2021-05-17 21:00:00'::timestamp, '2021-05-18 1:00:00'::timestamp, '2021-05-14 16:11:54'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1013, 15, 0,
                '2021-05-21 16:00:00'::timestamp, '2021-05-21 20:00:00'::timestamp, '2021-05-20 13:59:32'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1014, 4, 0,
                '2021-05-21 20:00:00'::timestamp, '2021-05-22 00:00:00'::timestamp, '2021-05-19 12:16:09'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1015, 12, 1,
                '2021-05-18 20:00:00'::timestamp, '2021-05-18 21:30:00'::timestamp, '2021-05-16 15:18:22'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1016, 15, 1,
                '2021-05-20 9:00:00'::timestamp, '2021-05-20 10:45:00'::timestamp, '2021-05-16 21:01:24'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1017, 14, 2,
                '2021-05-21 17:30:00'::timestamp, '2021-05-21 20:00:00'::timestamp, '2021-05-17 15:39:40'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1018, 17, 6,
                '2021-05-19 18:30:00'::timestamp, '2021-05-19 21:00:00'::timestamp, '2021-05-13 02:10:52'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1019, 17, 5,
                '2021-05-19 21:00:00'::timestamp, '2021-05-19 22:00:00'::timestamp, '2021-05-19 12:54:01'::timestamp);

INSERT INTO booking_room(id, user_id, room_id, start_time, end_time, creation_time) VALUES(1020, 21, 5,
                '2021-05-19 18:10:00'::timestamp, '2021-05-19 18:25:00'::timestamp, '2021-05-18 17:32:04'::timestamp);

insert into bike(id, room_id, user_id, bike_name) values (454, 9, 10, 'Tommaso Sorrento');
update bike set bike_name = 'ARD 1.2W' where id = 126;
select distinct
   student.first_name
   , student.second_name
from
   bike
join
   student
on
    bike.user_id = student.id;
delete from bike where room_id = 9;

select
    wm.num
    , bwm.start_time
    , bwm.end_time
    , s.first_name
    , s.second_name
from
    booking_washing_machine bwm
join
    washing_machine wm
on
    bwm.washing_machine_id = wm.id
join
    student s
on
    s.id = bwm.user_id
where
      dormitory_id = 0
order by
      num;
delete from washing_machine where washing_room_id = 4;
update washing_machine set is_active = false where id = 504;
insert into washing_machine(id, washing_room_id, is_active, num) values (543, 4, true, 1);

select
    student.first_name
    , student.second_name
    , sum(booking_clubhouse.time_interval::time) x
from
    student
join
    (select user_id, (end_time - booking_room.start_time) as time_interval from booking_room join room
        on booking_room.room_id = room.id where room.name = 'Клуб') as booking_clubhouse
on
    student.id = booking_clubhouse.user_id
group by
    student.id
order by
    x desc ;

with responsible as (
select
    student.id idx
    , student.first_name
    , student.second_name
from
    student
join
    room
on
    room.responsible_id = student.id
group by
     student.id
having
     count(student.id) > 1)
select
    responsible.first_name
    , responsible.second_name
    , room.name
    , dormitory.name
from
     responsible
join
     room
on
    responsible.idx = room.responsible_id
join dormitory on room.dormitory_id = dormitory.id
order by responsible.second_name;

select
    student.first_name
    , student.second_name
    , washing_machine.num
from
     booking_washing_machine
join
     student
on
    booking_washing_machine.user_id = student.id
join
     washing_machine
on
    washing_machine_id = washing_machine.id
where
      booking_washing_machine.start_time between current_date and current_date + '1 day'::interval
order by start_time;

select
    tool.name
from tool
except
select
    tool.name
from tool
where
      tool.id in
      (select tool_id from tool join booking_tool bt on tool.id = bt.tool_id where end_time >= current_timestamp);

select
    washing_machine.num
    , count(washing_machine.num)
from booking_washing_machine
join washing_machine
on booking_washing_machine.washing_machine_id = washing_machine.id and booking_washing_machine.user_id in (select student.id from student join dormitory on student.dormitory_id = dormitory.id where dormitory_id = 0)
group by washing_machine.num
order by count(washing_machine.num) desc;

create view dormitory_names as
select name
from dormitory;

create view students_in_2ka as
select first_name || ' ' || second_name as "Имя фамилия"
from student where dormitory_id = 0 limit 100;

create view v_room as
select
    s.second_name as "Фамимлия ответственного"
    , d.name as "Название общежития"
    , room.name "Название помещения"
    , description "Описание"
from room
join dormitory d on room.dormitory_id = d.id
join student s on s.id = room.responsible_id;

select *
from v_room;

create view v_bike as
select
   bike_name "Название велосипеда"
    , s.second_name as "Фамилия владельца"
from bike
join student s on bike.user_id = s.id;

create view v_available_tools as
select
    tool.name as "Название инструмента"
    , tool.description as "Описание"
from tool
except
select
    tool.name
    , tool.description
from tool
where
      tool.id in
      (select tool_id from tool join booking_tool bt on tool.id = bt.tool_id where end_time >= current_timestamp);

create view v_booking_tool as (
select
    t.name as "Название инструмента"
    , s.first_name || ' ' || s.second_name as "Имя и фамилия взявшего"
from booking_tool
join student s on booking_tool.user_id = s.id
join tool t on booking_tool.tool_id = t.id
);

select *
from db_project.v_booking_tool;

create view v_booking_room as (
select
    room.name as "Название помещения"
    , d.name as "Общежитие"
    , s.first_name || ' ' || s.second_name as "Имя и фамилия бронировавшего"
    , start_time as "Начало"
    , end_time as "Конец"
from booking_room
join room on booking_room.room_id = room.id
join student s on booking_room.user_id = s.id
join dormitory d on room.dormitory_id = d.id and s.dormitory_id = d.id
);

select * from v_booking_room;

create view v_booking_washing_machine as (
select
    d.name as "Общежитие"
    , wm.num as "Номер машинки"
    , s.first_name || ' ' || s.second_name as "Имя и фамилия бронировавшего"
    , start_time as "Начало"
    , end_time as "Конец"
from booking_washing_machine
join washing_machine wm on washing_machine_id = wm.id
join student s on booking_washing_machine.user_id = s.id
join room r on r.id = wm.washing_room_id
join dormitory d on s.dormitory_id = d.id and r.dormitory_id = d.id);

select * from v_booking_washing_machine;
























