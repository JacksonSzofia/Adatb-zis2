{
    "metadata": {
        "kernelspec": {
            "name": "SQL",
            "display_name": "SQL",
            "language": "sql"
        },
        "language_info": {
            "name": "sql",
            "version": ""
        }
    },
    "nbformat_minor": 2,
    "nbformat": 4,
    "cells": [
        {
            "cell_type": "code",
            "source": [
                "CREATE TABLE Ugyfel (\r\n",
                "    LOGIN VARCHAR(50) PRIMARY KEY,\r\n",
                "    EMAIL VARCHAR(100) MASKED WITH (FUNCTION = 'email()'),\r\n",
                "    NEV VARCHAR(100) MASKED WITH (FUNCTION = 'partial(1, \"xxxxx\", 1)'),\r\n",
                "    SZULEV INT MASKED WITH (FUNCTION = 'default()'),\r\n",
                "    NEM CHAR(1),\r\n",
                "    CIM VARCHAR(255) MASKED WITH (FUNCTION = 'partial(5, \"**********\", 5)')\r\n",
                ");\r\n",
                "\r\n",
                "INSERT INTO Ugyfel (LOGIN, EMAIL, NEV, SZULEV, NEM, CIM) VALUES\r\n",
                "('adam1', 'ádám.kiss@mail.hu', 'Kiss Ádám', 1991, 'F', '5630 Békés, Szolnoki út 8.'),\r\n",
                "('adam3', 'adam3@gmail.com', 'Barkóci Ádám', 1970, 'F', '3910 Tokaj, Dózsa György utca 37.'),\r\n",
                "('adam4', 'ádám.bieniek@mail.hu', 'Bieniek Ádám', 1976, 'F', '8630 Balatonboglár, Juhászföldi út 1.'),\r\n",
                "('agnes', 'agnes@gmail.com', 'Lengyel Ágnes', 1979, 'N', '5200 Törökszentmiklós, Deák Ferenc út 5.'),\r\n",
                "('agnes3', 'agnes3@gmail.com', 'Hartyánszky Ágnes', 1967, 'N', '6430 Bácsalmás, Posta köz 2.');\r\n",
                "\r\n",
                "CREATE USER MaskUser WITHOUT Login;\r\n",
                "GRANT SELECT ON Ugyfel TO MaskUser;\r\n",
                "\r\n",
                "EXECUTE AS User= 'MaskUser';\r\n",
                "SELECT * FROM Ugyfel\r\n",
                "REVERT\r\n",
                "\r\n",
                "SELECT LOGIN, NEV FROM Ugyfel ORDER BY NEV ASC;"
            ],
            "metadata": {
                "azdata_cell_guid": "2799588d-3bfb-437b-8ec0-1da4d649d457",
                "language": "sql"
            },
            "outputs": [],
            "execution_count": null
        }
    ]
}