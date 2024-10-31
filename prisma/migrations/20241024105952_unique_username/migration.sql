/*
  Warnings:

  - A unique constraint covering the columns `[username]` on the table `Personnel` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Personnel_username_key" ON "Personnel"("username");
