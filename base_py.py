import psycopg2

def create_db(cur): 
    cur.execute("""
    create table if not exists client (
        client_id serial primary key,    
        name varchar(20) not null,
        surname varchar(20) not null,
        email varchar(40) not null,
        unique(email)
    );            
    """)

    cur.execute("""
    create table if not exists phone(
        phone_id serial primary key,
        client_phone_id integer not null references client(client_id),
        phonenumber varchar(20) unique
    );
    """)


def add_client(cur, name, surname, email):
    cur.execute("""
    insert into client(name,surname,email) values(%s,%s,%s);
    """, (name,surname,email))


def add_phone(cur,client_phone_id, phonenumber):
    cur.execute("""
    insert into phone(client_phone_id, phonenumber) values (%s,%s);
""", (client_phone_id, phonenumber))


def change_client():
    '''Изменение информации o клиенте'''
    print("Для изменения информации o клиенте, пожалуйста, введите нужную Вам команду.\n "
        "1 - изменить имя; 2 - изменить фамилию; 3 - изменить e-mail; 4 - изменить номер телефона")


    while True:
        command_symbol = int(input())
        if command_symbol == 1:
            input_id_for_changing_name = input("Введите id клиента имя которого хотите изменить: ")
            input_name_for_changing = input("Введите имя для изменения: ")
            cur.execute("""
            UPDATE client SET name=%s WHERE client_id=%s;
            """, (input_name_for_changing, input_id_for_changing_name))
            break
        elif command_symbol == 2:
            input_id_for_changing_surname = input("Введите id клиента фамилию которого хотите изменить: ")
            input_surname_for_changing = input("Введите фамилию для изменения: ")
            cur.execute("""
            UPDATE client SET surname=%s WHERE client_id=%s;
            """, (input_surname_for_changing, input_id_for_changing_surname))
            break
        elif command_symbol == 3:
            input_id_for_changing_email = input("Введите id клиента e-mail которого хотите изменить: ")
            input_email_for_changing = input("Введите e-mail для изменения: ")
            cur.execute("""
            UPDATE client SET email=%s WHERE client_id=%s;
            """, (input_email_for_changing, input_id_for_changing_email))
            break
        elif command_symbol == 4:
            input_phonenumber_you_wanna_change = input("Введите номер телефона который Вы хотите изменить: ")
            input_phonenumber_for_changing = input("Введите новый номер телефона, который заменит собой старый: ")
            cur.execute("""
            UPDATE phone SET phonenumber=%s WHERE phonenumber=%s;
            """, (input_phonenumber_for_changing, input_phonenumber_you_wanna_change))
            break
        else:
            print("K сожалению, Вы ввели неправильную команду, пожалуйста, повторите ввод")


def delete_phonenumber():
    input_id_for_deleting_phonenumber = input("Введите id клиента номер телефона которого хотите удалить: ")
    input_phonenumber_for_deleting = input("Введите номер телефона который хотите удалить: ")
    with conn.cursor() as cur:
        cur.execute("""
        DELETE FROM phone WHERE client_id=%s AND phonenumber=%s
        """, (input_id_for_deleting_phonenumber, input_phonenumber_for_deleting))


def delete_client():
    input_id_for_deleting_client = input("Введите id клиента которого хотите удалить: ")
    input_client_surname_for_deleting = input("Введите фамилию клиента которого хотите удалить: ")
    with conn.cursor() as cur:
        cur.execute("""
        DELETE FROM phone WHERE client_phone_id=%s
        """, (input_id_for_deleting_client,))
        cur.execute("""
        DELETE FROM client WHERE client_id=%s AND surname=%s
        """, (input_id_for_deleting_client, input_client_surname_for_deleting))


def find_client():
    print("Для поиска информации o клиенте, пожалуйста, введите команду, где:\n "
          "1 - найти по имени; 2 - найти по фамилии; 3 - найти по e-mail; 4 - найти по номеру телефона")
    while True:
        input_command_for_finding = int(input("Введите команду для поиска информации o клиенте: "))
        if input_command_for_finding == 1:
            input_name_for_finding = input("Введите имя для поиска информации o клиенте: ")
            cur.execute("""
            SELECT client_id, name, surname, email, phonenumber
            FROM client AS c
            LEFT JOIN phone AS p ON p.client_phone_id = c.client_id
            WHERE name=%s
            """, (input_name_for_finding,))
            print(cur.fetchall())
        elif input_command_for_finding == 2:
            input_surname_for_finding = input("Введите фамилию для поиска информации o клиенте: ")
            cur.execute("""
            SELECT client_id, name, surname, email, phonenumber
            FROM client AS c
            LEFT JOIN phone AS p ON p.client_phone_id = c.client_id
            WHERE surname=%s
            """, (input_surname_for_finding,))
            print(cur.fetchall())
        elif input_command_for_finding == 3:
            input_email_for_finding = input("Введите email для поиска информации o клиенте: ")
            cur.execute("""
            SELECT client_id, name, surname, email, phonenumber
            FROM client AS c
            LEFT JOIN phone AS p ON p.client_phone_id = c.client_id
            WHERE email=%s
            """, (input_email_for_finding,))
            print(cur.fetchall())
        elif input_command_for_finding == 4:
            input_phonenumber_for_finding = input("Введите номер телефона для поиска информации o клиенте: ")
            cur.execute("""
            SELECT client_id, name, surname, email, phonenumber
            FROM client AS c
            LEFT JOIN phone AS cp ON p.client_phone_id = c.client_id
            WHERE phonenumber=%s
            """, (input_phonenumber_for_finding,))
            print(cur.fetchall())
        else:
            print("K сожалению, Вы ввели неправильную команду, пожалуйста, повторите ввод")


with psycopg2.connect(database="client_base", user="postgres", password="Elizazdra") as conn:
    with conn.cursor() as cur:
        create_db(cur)
        add_client(cur, "Иван", "Петров", "ivan.petrov@example.com")
        add_client(cur, "Анна", "Смирнова", "anna.smirnova@example.com")
        add_client(cur, "Алексей", "Иванов", "alexei.ivanov@example.com")
        add_client(cur, "Ольга", "Козлова", "olga.kozlova@example.com")
        add_client(cur, "Дмитрий", "Соколов", "dmitriy.sokolov@example.com")
        add_phone(cur, 1, "11111111")
        add_phone(cur, 2, "222222222")
        add_phone(cur, 3, "3333333333")
        add_phone(cur, 4, "44444444444")
        add_phone(cur, 5, "555555555555")
        change_client()
        delete_phonenumber()
        delete_client()
        find_client()
conn.close()