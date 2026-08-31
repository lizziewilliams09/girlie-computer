
import sys
import sqlite3
from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QFont, QFontDatabase

connection = sqlite3.connect('girlie.db')
cursor = connection.cursor()

sections = {
    "souvenirs": {
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

    "music": {
        "table": "music",
        "id": "MusicID",
        "fields": {
            "Title": "TEXT NOT NULL",
            "Artist": "TEXT NOT NULL",
            "AudioPath": "TEXT"
        }
    },

    "books": {
        "table": "books",
        "id": "BookID",
        "fields": {
            "Title": "TEXT NOT NULL",
            "Author": "TEXT",
            "DateRead": "DATE NOT NULL",
            "Rating": "INTEGER CHECK (Rating BETWEEN 1 AND 10)"
        }
    },

    "films": {
        "table": "films",
        "id": "FilmID",
        "fields": {
            "Title": "TEXT NOT NULL",
            "Year": "YEAR",
            "DateWatched": "DATE NOT NULL",
            "Rating": "INTEGER CHECK (Rating BETWEEN 1 AND 10)"
        }
    },

    "diary": {
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

    connection.commit()
    
def view_items(item_name):
    section = sections[item_name]

    cursor.execute(f"SELECT * FROM {section['table']}")
    rows = cursor.fetchall()

    for row in rows:
        print(f"<3 {row[0]}. {row[1].upper()} <3")

        for i, field in enumerate(section["fields"]):
            print(f"{field}: {row[i+1]}")

        print("\n")

class Backend(QObject):

    @Slot(str, "QVariantList")
    def add_item(self, item_name, field_inputs):
        section = sections[item_name]

        insert_item_sql = f"""
        INSERT INTO {section["table"]} ({", ".join(section["fields"])})
        VALUES ({", ".join(["?"] * len(section["fields"]))});
        """

        cursor.execute(insert_item_sql, field_inputs)
        connection.commit()

    @Slot(str, result="QVariantList")
    def get_items(self, item_name):
        section = sections[item_name]

        cursor.execute(f"SELECT * FROM {section['table']}")
        rows = cursor.fetchall()

        items = []

        for row in rows:
            item = {
                section["id"]: row[0]
            }

            for i, field in enumerate(section["fields"]):
                item[field] = row[i + 1]

            items.append(item)

        return items

    @Slot(str, int, "QVariantList")
    def edit_item(self, item_name, item_id, field_inputs):
        section = sections[item_name]

        set_clause = ", ".join(
            [f"{field} = ?" for field in section["fields"]]
        )

        edit_item_sql = f"""
        UPDATE {section["table"]}
        SET {set_clause}
        WHERE {section["id"]} = ?
        """

        cursor.execute(
            edit_item_sql,
            field_inputs + [item_id]
        )

        connection.commit()

    @Slot(str, int)
    def delete_item(self, item_name, item_id):
        section = sections[item_name]

        delete_item_sql = f"""
        DELETE FROM {section["table"]}
        WHERE {section["id"]} = ?
        """

        cursor.execute(delete_item_sql, (item_id,))
        connection.commit()

if __name__ == "__main__":
    create_tables()

    app = QGuiApplication(sys.argv)

    font_id = QFontDatabase.addApplicationFont("dogicapixel.ttf")
    font_family = QFontDatabase.applicationFontFamilies(font_id)[0]

    app.setFont(QFont(font_family))

    engine = QQmlApplicationEngine()
    engine.addImportPath(sys.path[0])
    
    # Create Python backend object
    backend = Backend()

    # Give QML access to it under the name "backend"
    engine.rootContext().setContextProperty("backend", backend)

    engine.loadFromModule("GirlieComputer", "Main")

    if not engine.rootObjects():
        connection.close()
        sys.exit(-1)

    exit_code = app.exec()

    del engine
    connection.close()

    sys.exit(exit_code)