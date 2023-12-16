const jwt = require("jsonwebtoken");

module.exports = {
  authCheck: async (req, res, next) => {
    console.log("ok");
    const authHeader = req.headers["authorization"];

    const token = authHeader && authHeader.split(" ")[1];
    console.log({ token });

    if (!token) {
      return res.status(401).json({ message: "Unauthorized access" });
    }

    try {
      const decoded = jwt.verify(token, process.env.JWT_SECRET);
      req.user = decoded;
      next();
    } catch (err) {
      return res.status(403).json({ message: "Invalid token" });
    }
  },
};
