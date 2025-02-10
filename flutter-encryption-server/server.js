const express = require("express");
const bodyParser = require("body-parser");
const CryptoJS = require("crypto-js");
const cors = require("cors");

const app = express();
app.use(bodyParser.json());
app.use(cors());

const AES_KEY = "A|*/X&>g%v@|F:Z4s9A:nrQvxiRy*?zJ"; // Same key as Flutter
const AES_IV = "7l!y8lJ%kpyMy*iC"; // Same IV as Flutter

// Function to decrypt data
function decryptAES(encryptedText) {
  let bytes = CryptoJS.AES.decrypt(encryptedText, CryptoJS.enc.Utf8.parse(AES_KEY), {
    iv: CryptoJS.enc.Utf8.parse(AES_IV),
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7,
  });
  return bytes.toString(CryptoJS.enc.Utf8);
}

// Function to encrypt data
function encryptAES(text) {
  let encrypted = CryptoJS.AES.encrypt(text, CryptoJS.enc.Utf8.parse(AES_KEY), {
    iv: CryptoJS.enc.Utf8.parse(AES_IV),
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7,
  });
  return encrypted.toString();
}

// API Route to receive encrypted data, decrypt it, and return an encrypted response
app.post("/api/encrypt-test", (req, res) => {
  try {
    console.log("Encrypted Data Received:", req.body.encryptedData);

    // Decrypt received data
    const decryptedData = decryptAES(req.body.encryptedData);
    console.log("Decrypted Data:", decryptedData);

    // Encrypt response
    const encryptedResponse = encryptAES(JSON.stringify({ message: "Hello from the server!" }));

    res.json({ encryptedData: encryptedResponse });
  } catch (error) {
    console.error("Error:", error);
    res.status(500).json({ error: "Decryption failed" });
  }
});

// Start the server
const PORT = 5000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
