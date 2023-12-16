/*
  Warnings:

  - You are about to drop the column `BIRTH_DATE` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `EMPLOYMENT_STATUS` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `FIRST_NAME` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `GENDER` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `LAST_NAME` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `MARITAL_STATUS` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `MIDDLE_NAME` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `OCCUPATION` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `PARTY_ID` on the `Person` table. All the data in the column will be lost.
  - You are about to drop the column `SALUTATION` on the `Person` table. All the data in the column will be lost.
  - Added the required column `employee_status` to the `Person` table without a default value. This is not possible if the table is not empty.
  - Added the required column `marital_status` to the `Person` table without a default value. This is not possible if the table is not empty.
  - Added the required column `partyId` to the `Person` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `Person` DROP FOREIGN KEY `Person_PARTY_ID_fkey`;

-- AlterTable
ALTER TABLE `Person` DROP COLUMN `BIRTH_DATE`,
    DROP COLUMN `EMPLOYMENT_STATUS`,
    DROP COLUMN `FIRST_NAME`,
    DROP COLUMN `GENDER`,
    DROP COLUMN `LAST_NAME`,
    DROP COLUMN `MARITAL_STATUS`,
    DROP COLUMN `MIDDLE_NAME`,
    DROP COLUMN `OCCUPATION`,
    DROP COLUMN `PARTY_ID`,
    DROP COLUMN `SALUTATION`,
    ADD COLUMN `birth_date` DATETIME(3) NULL,
    ADD COLUMN `employee_status` ENUM('EmpsFullTime', 'EmpsPartTime', 'EmpsSelf', 'EmpsHouse', 'EmpsRetired', 'EmpsStudent', 'EmpsUnemployed') NOT NULL,
    ADD COLUMN `first_name` VARCHAR(191) NULL,
    ADD COLUMN `gender` VARCHAR(191) NULL,
    ADD COLUMN `last_name` VARCHAR(191) NULL,
    ADD COLUMN `marital_status` ENUM('MarsSingle', 'MarsMarried', 'MarsDivorced', 'MarsWidow') NOT NULL,
    ADD COLUMN `middle_name` VARCHAR(191) NULL,
    ADD COLUMN `occupation` VARCHAR(191) NULL,
    ADD COLUMN `partyId` INTEGER NOT NULL,
    ADD COLUMN `salutation` VARCHAR(191) NULL;

-- AddForeignKey
ALTER TABLE `Person` ADD CONSTRAINT `Person_partyId_fkey` FOREIGN KEY (`partyId`) REFERENCES `Party`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
