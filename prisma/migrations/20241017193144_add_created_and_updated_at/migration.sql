/*
  Warnings:

  - Added the required column `updatedAt` to the `ToDoItem` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ToDoItem" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "task" TEXT NOT NULL,
    "completed" BOOLEAN NOT NULL,
    "description" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_ToDoItem" ("completed", "description", "id", "task") SELECT "completed", "description", "id", "task" FROM "ToDoItem";
DROP TABLE "ToDoItem";
ALTER TABLE "new_ToDoItem" RENAME TO "ToDoItem";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
