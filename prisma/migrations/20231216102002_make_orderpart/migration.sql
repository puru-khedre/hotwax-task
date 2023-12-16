-- CreateTable
CREATE TABLE `OrderPart` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `partName` VARCHAR(191) NULL,
    `statusId` VARCHAR(191) NULL,
    `vendorPartyId` VARCHAR(191) NULL,
    `facilityId` VARCHAR(191) NULL,
    `shipmentMethodEnum` ENUM('ShMthNextDayPri', 'ShMthNextDay', 'ShMthSecondDay', 'ShMthThirdDay', 'ShMthGround', 'ShMthGroundCom', 'ShMthMotor', 'ShMthPickUp') NULL,
    `partyId` INTEGER NULL,
    `customerPartyId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `OrderPart` ADD CONSTRAINT `OrderPart_customerPartyId_fkey` FOREIGN KEY (`customerPartyId`) REFERENCES `Party`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
