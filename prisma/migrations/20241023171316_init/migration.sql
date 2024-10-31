-- CreateEnum
CREATE TYPE "invoice_status" AS ENUM ('UNPAID', 'PAID', 'PARTIALLY_PAID', 'LSPD');

-- CreateEnum
CREATE TYPE "BackofficeRole" AS ENUM ('SUPERADMIN', 'ADMIN', 'MANAGER', 'USER');

-- CreateTable
CREATE TABLE "BirthReport" (
    "id" SERIAL NOT NULL,
    "uuid" TEXT NOT NULL,
    "motherUuid" TEXT NOT NULL,
    "fatherUuid" TEXT NOT NULL,
    "conceptionDate" TIMESTAMP(3) NOT NULL,
    "birthDay" TIMESTAMP(3) NOT NULL,
    "durationOfBirth" INTEGER NOT NULL,
    "birthType" TEXT NOT NULL,
    "perineotomy" TEXT NOT NULL,
    "anestheticType" TEXT NOT NULL,
    "babyWeight" DOUBLE PRECISION NOT NULL,
    "babyHeight" DOUBLE PRECISION NOT NULL,
    "firstMinApgarScore" INTEGER NOT NULL,
    "fifthMinApgarScore" INTEGER NOT NULL,
    "complications" TEXT,
    "details" TEXT,
    "reasonOfVisit" TEXT NOT NULL,
    "careDetails" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "invoiceUuid" TEXT NOT NULL,

    CONSTRAINT "BirthReport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Invoice" (
    "id" SERIAL NOT NULL,
    "uuid" TEXT NOT NULL,
    "patientUuid" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "description" TEXT NOT NULL,
    "status" "invoice_status" NOT NULL DEFAULT 'UNPAID',
    "paidAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "surgeryReportId" INTEGER,
    "birthReportId" INTEGER,

    CONSTRAINT "Invoice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InvoiceDetail" (
    "id" SERIAL NOT NULL,
    "uuid" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "InvoiceDetail_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Patient" (
    "id" SERIAL NOT NULL,
    "uuid" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "vitalCardNumber" INTEGER NOT NULL,
    "dateOfBirth" TIMESTAMP(3) NOT NULL,
    "isLSPD" BOOLEAN NOT NULL,

    CONSTRAINT "Patient_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Personnel" (
    "id" SERIAL NOT NULL,
    "uuid" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "emsRole" TEXT NOT NULL,
    "boRole" "BackofficeRole" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Personnel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Report" (
    "id" SERIAL NOT NULL,
    "uuid" TEXT NOT NULL,
    "patientUuid" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "reasonOfVisit" TEXT NOT NULL,
    "careDetails" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "invoiceUuid" TEXT NOT NULL,

    CONSTRAINT "Report_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SurgeryReport" (
    "id" SERIAL NOT NULL,
    "uuid" TEXT NOT NULL,
    "patientUuid" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "surgeryType" TEXT NOT NULL,
    "details" TEXT NOT NULL,
    "prescription" TEXT,
    "postOpCare" TEXT,
    "registrationNumber" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "invoiceUuid" TEXT NOT NULL,

    CONSTRAINT "SurgeryReport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_BirthReportToPersonnel" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_InvoiceToInvoiceDetail" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PersonnelToReport" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_PersonnelToSurgeryReport" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "BirthReport_uuid_key" ON "BirthReport"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "BirthReport_invoiceUuid_key" ON "BirthReport"("invoiceUuid");

-- CreateIndex
CREATE UNIQUE INDEX "Invoice_uuid_key" ON "Invoice"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "InvoiceDetail_uuid_key" ON "InvoiceDetail"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "Patient_uuid_key" ON "Patient"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "Personnel_uuid_key" ON "Personnel"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "Report_uuid_key" ON "Report"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "Report_invoiceUuid_key" ON "Report"("invoiceUuid");

-- CreateIndex
CREATE UNIQUE INDEX "SurgeryReport_uuid_key" ON "SurgeryReport"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "SurgeryReport_invoiceUuid_key" ON "SurgeryReport"("invoiceUuid");

-- CreateIndex
CREATE UNIQUE INDEX "_BirthReportToPersonnel_AB_unique" ON "_BirthReportToPersonnel"("A", "B");

-- CreateIndex
CREATE INDEX "_BirthReportToPersonnel_B_index" ON "_BirthReportToPersonnel"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_InvoiceToInvoiceDetail_AB_unique" ON "_InvoiceToInvoiceDetail"("A", "B");

-- CreateIndex
CREATE INDEX "_InvoiceToInvoiceDetail_B_index" ON "_InvoiceToInvoiceDetail"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PersonnelToReport_AB_unique" ON "_PersonnelToReport"("A", "B");

-- CreateIndex
CREATE INDEX "_PersonnelToReport_B_index" ON "_PersonnelToReport"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PersonnelToSurgeryReport_AB_unique" ON "_PersonnelToSurgeryReport"("A", "B");

-- CreateIndex
CREATE INDEX "_PersonnelToSurgeryReport_B_index" ON "_PersonnelToSurgeryReport"("B");

-- AddForeignKey
ALTER TABLE "BirthReport" ADD CONSTRAINT "BirthReport_motherUuid_fkey" FOREIGN KEY ("motherUuid") REFERENCES "Patient"("uuid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BirthReport" ADD CONSTRAINT "BirthReport_fatherUuid_fkey" FOREIGN KEY ("fatherUuid") REFERENCES "Patient"("uuid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BirthReport" ADD CONSTRAINT "BirthReport_invoiceUuid_fkey" FOREIGN KEY ("invoiceUuid") REFERENCES "Invoice"("uuid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_patientUuid_fkey" FOREIGN KEY ("patientUuid") REFERENCES "Patient"("uuid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD CONSTRAINT "Report_patientUuid_fkey" FOREIGN KEY ("patientUuid") REFERENCES "Patient"("uuid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD CONSTRAINT "Report_invoiceUuid_fkey" FOREIGN KEY ("invoiceUuid") REFERENCES "Invoice"("uuid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SurgeryReport" ADD CONSTRAINT "SurgeryReport_patientUuid_fkey" FOREIGN KEY ("patientUuid") REFERENCES "Patient"("uuid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SurgeryReport" ADD CONSTRAINT "SurgeryReport_invoiceUuid_fkey" FOREIGN KEY ("invoiceUuid") REFERENCES "Invoice"("uuid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BirthReportToPersonnel" ADD CONSTRAINT "_BirthReportToPersonnel_A_fkey" FOREIGN KEY ("A") REFERENCES "BirthReport"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BirthReportToPersonnel" ADD CONSTRAINT "_BirthReportToPersonnel_B_fkey" FOREIGN KEY ("B") REFERENCES "Personnel"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_InvoiceToInvoiceDetail" ADD CONSTRAINT "_InvoiceToInvoiceDetail_A_fkey" FOREIGN KEY ("A") REFERENCES "Invoice"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_InvoiceToInvoiceDetail" ADD CONSTRAINT "_InvoiceToInvoiceDetail_B_fkey" FOREIGN KEY ("B") REFERENCES "InvoiceDetail"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PersonnelToReport" ADD CONSTRAINT "_PersonnelToReport_A_fkey" FOREIGN KEY ("A") REFERENCES "Personnel"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PersonnelToReport" ADD CONSTRAINT "_PersonnelToReport_B_fkey" FOREIGN KEY ("B") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PersonnelToSurgeryReport" ADD CONSTRAINT "_PersonnelToSurgeryReport_A_fkey" FOREIGN KEY ("A") REFERENCES "Personnel"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PersonnelToSurgeryReport" ADD CONSTRAINT "_PersonnelToSurgeryReport_B_fkey" FOREIGN KEY ("B") REFERENCES "SurgeryReport"("id") ON DELETE CASCADE ON UPDATE CASCADE;
