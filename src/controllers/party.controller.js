const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

module.exports = {
  create: async (req, res) => {
    const { partyType } = req.body;

    try {
      const party = await prisma.party.create({
        data: { PARTY_TYPE: partyType },
      });

      if (!party) {
        throw new Error("Internal database error");
      }

      res.json(party);
    } catch (error) {
      res.json({ error: error.message });
    }
  },
  getAll: async (req, res) => {
    try {
      const parties = await prisma.party.findMany();
      res.json({ parties });
    } catch (error) {
      res.json({ error: error.message });
    }
  },

  updateOne: async (req, res) => {
    const { id } = req.params;
    const data = req.body;
    console.log(data);

    try {
      const party = await prisma.party.update({
        where: { id: +id },
        data: { PARTY_TYPE: data.partyType },
      });

      res.json(party);
    } catch (error) {
      res.json({ error: error.message });
    }
  },
};
