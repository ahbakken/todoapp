/*
  Warnings:

  - Added the required column `ToDoItemId` to the `ToDoItem` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "Prize" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "prizeName" TEXT NOT NULL,
    "prizeDescription" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "TodoItemId" TEXT NOT NULL,
    CONSTRAINT "Prize_TodoItemId_fkey" FOREIGN KEY ("TodoItemId") REFERENCES "ToDoItem" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "ToDoItemId" TEXT
);

-- CreateTable
CREATE TABLE "Tag" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "_TagToToDoItem" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_TagToToDoItem_A_fkey" FOREIGN KEY ("A") REFERENCES "Tag" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_TagToToDoItem_B_fkey" FOREIGN KEY ("B") REFERENCES "ToDoItem" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ToDoItem" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "task" TEXT NOT NULL,
    "completed" BOOLEAN NOT NULL,
    "description" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    "ToDoItemId" TEXT NOT NULL,
    CONSTRAINT "ToDoItem_ToDoItemId_fkey" FOREIGN KEY ("ToDoItemId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_ToDoItem" ("completed", "createdAt", "description", "id", "task", "updatedAt") SELECT "completed", "createdAt", "description", "id", "task", "updatedAt" FROM "ToDoItem";
DROP TABLE "ToDoItem";
ALTER TABLE "new_ToDoItem" RENAME TO "ToDoItem";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "Prize_TodoItemId_key" ON "Prize"("TodoItemId");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_TagToToDoItem_AB_unique" ON "_TagToToDoItem"("A", "B");

-- CreateIndex
CREATE INDEX "_TagToToDoItem_B_index" ON "_TagToToDoItem"("B");
