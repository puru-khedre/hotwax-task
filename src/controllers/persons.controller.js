const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

module.exports = {
  create: async (req, res) => {
    const { body } = req;

    const partyId = +body.partyId;
    delete body.partyId;

    try {
      const person = await prisma.person.create({
        data: {
          party: {
            connectOrCreate: {
              where: { id: partyId },
              create: { PARTY_TYPE: "PtyAutomatedAgent" },
            },
          },
          ...body,
        },
      });
      res.json({ data: person });
    } catch (e) {
      console.log(e.message);
      res.status(400).send({ error: e.message });
    }
  },

  getSingle: async (req, res) => {
    const { id } = req.params;
    try {
      const person = await prisma.person.findFirst(+id);
      console.log(person);
      res.json(person);
    } catch (e) {
      res.status(404).json({ error: e.message });
    }
  },

  updateOne: async (req, res) => {
    let { id } = req.params;
    id = +id;

    const data = req.body;
    console.log(data);

    try {
      const person = await prisma.person.update({ where: { id }, data });
      res.json(person);
    } catch (e) {
      res.status(400).json({ error: e.message });
    }
  },
};
