/*
  Warnings:

  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `userId` on the `ToDoItem` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX "User_email_key";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "User";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ToDoItem" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "task" TEXT NOT NULL,
    "completed" BOOLEAN NOT NULL,
    "description" TEXT
);
INSERT INTO "new_ToDoItem" ("completed", "description", "id", "task") SELECT "completed", "description", "id", "task" FROM "ToDoItem";
DROP TABLE "ToDoItem";
ALTER TABLE "new_ToDoItem" RENAME TO "ToDoItem";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
