/*
  Warnings:

  - You are about to drop the column `email` on the `Personnel` table. All the data in the column will be lost.
  - Added the required column `username` to the `Personnel` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Personnel" DROP COLUMN "email",
ADD COLUMN     "username" TEXT NOT NULL;
