/*
  Warnings:

  - Added the required column `status` to the `OrderPart` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `OrderPart` ADD COLUMN `orderHeaderId` INTEGER NULL,
    ADD COLUMN `status` ENUM('OrderOpen', 'OrderRequested', 'OrderProposed', 'OrderPlaced', 'OrderHold', 'OrderProcessing', 'OrderApproved', 'OrderSent', 'OrderCompleted', 'OrderRejected', 'OrderCancelled', 'OrderWishList', 'OrderGiftRegistry', 'OrderAutoReorder') NOT NULL;

-- CreateTable
CREATE TABLE `order_header` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `orderName` VARCHAR(191) NULL,
    `placedDate` DATETIME(3) NULL,
    `approvedDate` DATETIME(3) NULL,
    `status` ENUM('OrderOpen', 'OrderRequested', 'OrderProposed', 'OrderPlaced', 'OrderHold', 'OrderProcessing', 'OrderApproved', 'OrderSent', 'OrderCompleted', 'OrderRejected', 'OrderCancelled', 'OrderWishList', 'OrderGiftRegistry', 'OrderAutoReorder') NOT NULL,
    `productStoreId` VARCHAR(191) NULL,
    `salesChannelEnumId` ENUM('Web', 'WebExternal', 'POS', 'Fax', 'Phone', 'Email', 'PostalMail', 'Affiliate', 'EBay', 'Amazon', 'EDI', 'OAGIs', 'Unknown', 'TestOrder') NOT NULL,
    `grandTotal` DOUBLE NULL,
    `COMPLETED_DATE` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `OrderPart` ADD CONSTRAINT `OrderPart_orderHeaderId_fkey` FOREIGN KEY (`orderHeaderId`) REFERENCES `order_header`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
