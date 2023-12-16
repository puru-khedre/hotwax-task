// const { PrismaClient } = require("@prisma/client");
// const prisma = new PrismaClient();

// async function main() {
//   try {
//     // Seeding logic goes here
//     await prisma.person.create({
//       data: {
//         PARTY_ID: "123",
//         SALUTATION: "Mr.",
//         FIRST_NAME: "John",
//         MIDDLE_NAME: "Doe",
//         LAST_NAME: "Smith",
//         GENDER: "Male",
//         BIRTH_DATE: new Date("1990-01-01"),
//         MARITAL_STATUS: "MarsMarried",
//         EMPLOYMENT_STATUS: "EmpsFullTime",
//         OCCUPATION: "Engineer",
//       },
//     });
//   } catch (error) {
//     console.error(error);
//   } finally {
//     await prisma.$disconnect();
//   }
// }

// main();

const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function main() {
  const party = await prisma.party.create({
    data: {
      PARTY_TYPE: "PtyAutomatedAgent",
    },
  });

  const person = await prisma.person.create({
    data: {
      employee_status: "EmpsFullTime",
      marital_status: "MarsMarried",
      party: { connect: { id: 16 } },
    },
  });

  // console.log({ party, person1, person2 });
}
main()
  .catch((e) => {
    throw e;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
