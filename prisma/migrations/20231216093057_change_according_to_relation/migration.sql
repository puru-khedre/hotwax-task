/*
  Warnings:

  - The primary key for the `Party` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `PARTY_ID` on the `Party` table. All the data in the column will be lost.
  - The primary key for the `Person` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `PARTY_ID` on the `Person` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - Added the required column `id` to the `Party` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `Person` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Person` DROP FOREIGN KEY `Person_PARTY_ID_fkey`;

-- AlterTable
ALTER TABLE `Party` DROP PRIMARY KEY,
    DROP COLUMN `PARTY_ID`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `Person` DROP PRIMARY KEY,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    MODIFY `PARTY_ID` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AddForeignKey
ALTER TABLE `Person` ADD CONSTRAINT `Person_PARTY_ID_fkey` FOREIGN KEY (`PARTY_ID`) REFERENCES `Party`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
