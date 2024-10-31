/*
  Warnings:

  - You are about to drop the column `firstName` on the `Patient` table. All the data in the column will be lost.
  - You are about to drop the column `lastName` on the `Patient` table. All the data in the column will be lost.
  - Added the required column `firstname` to the `Patient` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lastname` to the `Patient` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Patient" RENAME COLUMN "firstName" TO "firstname";
ALTER TABLE "Patient" RENAME COLUMN "lastName" TO "lastname";
