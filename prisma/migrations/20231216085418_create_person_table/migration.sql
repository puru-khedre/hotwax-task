-- CreateTable
CREATE TABLE `Person` (
    `PARTY_ID` VARCHAR(191) NOT NULL,
    `SALUTATION` VARCHAR(191) NULL,
    `FIRST_NAME` VARCHAR(191) NULL,
    `MIDDLE_NAME` VARCHAR(191) NULL,
    `LAST_NAME` VARCHAR(191) NULL,
    `GENDER` VARCHAR(191) NULL,
    `BIRTH_DATE` DATETIME(3) NULL,
    `MARITAL_STATUS` ENUM('MarsSingle', 'MarsMarried', 'MarsDivorced', 'MarsWidow') NOT NULL,
    `EMPLOYMENT_STATUS` ENUM('EmpsFullTime', 'EmpsPartTime', 'EmpsSelf', 'EmpsHouse', 'EmpsRetired', 'EmpsStudent', 'EmpsUnemployed') NOT NULL,
    `OCCUPATION` VARCHAR(191) NULL,

    PRIMARY KEY (`PARTY_ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
