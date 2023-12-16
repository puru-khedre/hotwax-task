const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const jwt = require("jsonwebtoken");

module.exports = {
  login: async (req, res) => {
    try {
      const { username, password } = req.body;

      const admin = await prisma.admin.findUnique({
        where: { username, password },
      });

      if (!admin) {
        throw new Error("Admin not found");
      }
      const token = jwt.sign({ admin }, process.env.JWT_SECRET);
      console.log(token);

      return res.json({ message: "ok", admin, token });
    } catch (err) {
      res.json({ error: err.message });
    }
  },
};
