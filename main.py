import sqlite3

connection = sqlite3.connect('girlie.db')
cursor = connection.cursor()

sections = {
    "B": {
        "name": "Souvenirs",
        "table": "souvenirs",
        "id": "SouvenirID",
        "fields": {
            "Name": "TEXT NOT NULL",
            "Story": "TEXT",
            "Date": "DATE",
            "Place": "TEXT",
            "ImagePath": "TEXT"
        }
    },

    "C": {
        "name": "Music",
        "table": "music",
        "id": "MusicID",
        "fields": {
            "Title": "TEXT NOT NULL",
            "Artist": "TEXT NOT NULL",
            "AudioPath": "TEXT"
        }
    },

    "D": {
        "name": "Books",
        "table": "books",
        "id": "BookID",
        "fields": {
            "Title": "TEXT NOT NULL",
            "Author": "TEXT",
            "DateRead": "DATE NOT NULL",
            "Rating": "INTEGER CHECK (Rating BETWEEN 1 AND 10)"
        }
    },

    "E": {
        "name": "Films",
        "table": "films",
        "id": "FilmID",
        "fields": {
            "Title": "TEXT NOT NULL",
            "Year": "YEAR",
            "DateWatched": "DATE NOT NULL",
            "Rating": "INTEGER CHECK (Rating BETWEEN 1 AND 10)"
        }
    },

    "F": {
        "name": "Diary",
        "table": "diary",
        "id": "EntryID",
        "fields": {
            "Title": "TEXT",
            "Date": "DATE NOT NULL",
            "Entry": "TEXT NOT NULL",
            "Time": "TIME"
        }
    }
}

def create_tables(sections=sections, cursor=cursor):
  for section in sections.values():

      columns = [f"{section['id']} INTEGER PRIMARY KEY"]

      for field, definition in section["fields"].items():
          columns.append(f"{field} {definition}")

      create_table_sql = f"""
          CREATE TABLE IF NOT EXISTS {section['table']} (
              {", ".join(columns)}
          );
      """

      cursor.execute(create_table_sql)

def start_screen():
  while True:
    print("""<3 GIRLIE COMPUTER <3\n\n
    A - My World\n
    B - Souvenirs\n
    C - Music\n
    D - Books\n
    E - Films\n
    F - Diary\n
    G - EXIT""")
    action1 = input("Select an Option: ")
    print("\n")

    if action1 == "A":
      print("Not Available Yet - SORRY!")
    elif action1 in sections:
       section = sections[action1]
       print(f"""<3 {section["name"].upper()} <3\n\n
      A - View {section["name"]}\n
      B - Add {section["name"]}\n
      C - Edit {section["name"]}\n
      D - Delete {section["name"]}\n
      """)
       action2 = input("Select an Option: ")

       if action2 == "A":
          view_items(action1)
       elif action2 == "B":
          insert_item(action1)
       elif action2 == "C":
          edit_item(action1)
       elif action2 == "D":
          delete_item(action1)
    elif action1 == "G":
      print("<3 GOODBYE <3")
      break

    print("\n")

def view_items(action1, cursor=cursor, sections=sections):
  section = sections[action1]

  cursor.execute(f"SELECT * FROM {section['table']}")
  rows = cursor.fetchall()

  for row in rows:
    print(f"<3 {row[0]}. {row[1].upper()} <3")

    for i, field in enumerate(section["fields"]):
        print(f"{field}: {row[i+1]}")

    print("\n")

def insert_item(action1, cursor=cursor, sections=sections):
  section = sections[action1]

  field_inputs = []

  for field in section["fields"]:
    field_inputs.append(input(f"{field}: "))

  insert_item_sql = f"""
  INSERT INTO {section["table"]} ({", ".join(section["fields"])})
  VALUES ({", ".join(["?"] * len(section["fields"]))});
  """

  confirm = input("Are you sure you would like to make these changes? Y/N: ")

  if confirm.upper() == "Y":
    cursor.execute(insert_item_sql, field_inputs)


def edit_item(action1, cursor=cursor, sections=sections):
    section = sections[action1]

    view_items(action1)

    chosen_item = input("Please type the number of the item you would like to edit: ")

    chosen_field = input("Please type the field you would like to change: ")

    while chosen_field not in section["fields"]:
      print("That is not a valid field.")
      chosen_field = input("Please type the field you would like to change: ")

    changed_value = input("Please type what you would like to change it to: ")

    edit_item_sql = f"""
    UPDATE {section["table"]}
    SET {chosen_field} = ?
    WHERE {section["id"]} = ?
    """
    confirm = input("Are you sure you would like to make these changes? Y/N: ")

    if confirm.upper() == "Y":
      cursor.execute(edit_item_sql, (changed_value, chosen_item))


def delete_item(action1, cursor=cursor, sections=sections):

    section = sections[action1]

    view_items(action1)

    chosen_item = input("Please type the number of the item you would like to delete: ")

    confirm = input("Are you sure? Y/N: ")

    delete_item_sql = f"""
    DELETE FROM {section["table"]}
    WHERE {section["id"]} = ?
    """

    if confirm.upper() == "Y":
      cursor.execute(delete_item_sql, (chosen_item,))

create_tables()
start_screen()

connection.commit()
connection.close()