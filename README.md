# 🔐 Flutter API Encryption
Secure API requests in your Flutter app using AES encryption. This project demonstrates how to encrypt and decrypt sensitive data before sending it to a Node.js backend, ensuring secure communication.

## 🚀 Features
- AES encryption (Advanced Encryption Standard) using **PointyCastle**
- Secure API calls between Flutter and a **Node.js backend**
- Prevents sensitive data (passwords, tokens, etc.) from being intercepted
- Implements **CBC mode** for secure encryption
- Includes encryption and decryption utilities

---

## 📦 Installation

### 1️⃣ **Clone the Repository**
```bash
git clone https://github.com/magnuslopes23/flutter-api-encryption.git
cd flutter-api-encryption
```

### 2️⃣ **Install Flutter Dependencies**
```bash
flutter pub get
```

### 3️⃣ **Install Backend Dependencies**
Navigate to the **server folder** and install required Node.js dependencies:
```bash
cd server
npm install
```

---

## 🔧 **How It Works**
### 🔑 **Encryption Process**
1. User data is **encrypted** using AES before sending it via API.
2. The backend **decrypts** the request and processes the data.
3. The backend sends **encrypted responses** back to Flutter.
4. Flutter **decrypts** the response before displaying it.

### 📂 **Project Structure**
```
📦 flutter-api-encryption
 ┣ 📂 lib
 ┃ ┣ 📜 main.dart             # Flutter app entry point
 ┃ ┣ 📜 api_service.dart       # API request handler
 ┃ ┣ 📜 encryption_util.dart   # AES encryption & decryption utility
 ┃ ┗ 📜 models.dart           # Data models (if any)
 ┣ 📂 server
 ┃ ┣ 📜 server.js              # Node.js API server
 ┃ ┣ 📜 encryption.js          # AES encryption for backend
 ┃ ┣ 📜 package.json           # Backend dependencies
 ┃ ┗ 📜 .env                   # Environment variables (DO NOT COMMIT)
 ┣ 📜 README.md                # Documentation
 ┣ 📜 pubspec.yaml             # Flutter dependencies
 ┗ 📜 .gitignore               # Ignore unnecessary files
```

---

## 🛠️ **Usage**

### 🔹 **Run the Flutter App**
```bash
flutter run
```

### 🔹 **Run the Node.js Backend**
Navigate to the **server** directory:
```bash
cd server
node server.js
```
The API will be available at:
```
http://localhost:5000/api/encrypt-test
```

---

## 🛡 **Security Best Practices**
✅ **Do NOT hardcode encryption keys in your app.** Use `Flutter Secure Storage` or fetch keys dynamically.  
✅ **Always use HTTPS** instead of HTTP for API calls.  
✅ **Rotate encryption keys periodically** to enhance security.  
✅ **Validate encrypted payloads server-side** to prevent attacks.  
✅ **Never log sensitive encrypted data** in production.  

---

## 📌 **API Example**
### **1️⃣ Request (Flutter → Server)**
**Before Encryption**
```json
{
  "username": "FlutterDev",
  "password": "SecurePass123"
}
```
**After Encryption**
```json
{
  "encryptedData": "bGQeJDkS1b4k37hfdoWJ4PLoJk=="
}
```

### **2️⃣ Response (Server → Flutter)**
**Encrypted Response**
```json
{
  "encryptedData": "a0F8u3bPqL=="
}
```
**Decrypted Response**
```json
{
  "message": "Login Successful"
}
```

---

## 💡 **Contributing**
Contributions are welcome! Feel free to open an **issue** or **pull request**.

### 📜 **To Contribute:**
1. Fork the repo.
2. Create a new branch (`feature-xyz`).
3. Commit your changes.
4. Submit a Pull Request. 🚀

---

## 📄 **License**
This project is licensed under the **MIT License**. See [LICENSE](LICENSE) for details.

---

---
## 📖 Read More
Check out the full article on Medium: [Secure Your Flutter API Calls](https://medium.com/@magnuslopes23/secure-your-flutter-api-calls-encrypt-decrypt-data-like-a-pro-e2f479276c22) 🚀
---

## 🌟 **Show Your Support**
If this project helps you, **please give it a ⭐ on GitHub** and share it with your fellow developers! 🚀🔥

Happy coding! 👨‍💻🎉
