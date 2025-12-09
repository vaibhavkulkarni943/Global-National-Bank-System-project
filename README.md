# 🌍 Global-National-Bank-System-project

> A simple bank management web application built with **Java**, **Servlets**, **JSP**, **JDBC** and **MySQL**.

---

## 🚀 Project Overview

This repository contains a Java web application that simulates basic banking operations (create account, login, view balance, deposit, withdraw, transfer). The frontend uses JSP, business logic lives in Servlets, and data persistence is handled using JDBC with a MySQL database. Designed to be deployed on Apache Tomcat (or any Java EE-compatible servlet container).

---

## 🧰 Tech Stack

* Java (JDK 8+)
* Servlets & JSP
* JDBC (no ORM)
* MySQL
* Apache Tomcat (recommended)
* (Optional) Maven or Gradle for build

---

## ✅ Features

* User/Account creation
* Secure login (basic session-based auth)
* View account details & transaction history
* Deposit and Withdraw
* Fund Transfer between accounts
* Simple validation and error-handling

---

## 📥 Prerequisites

Make sure you have the following installed on your machine:

* Java JDK 8 or newer
* MySQL server
* Apache Tomcat 8/9/10 (or other servlet container)
* Git
* (Optional) Maven or Gradle

---

## 🛠️ Step-by-step Setup & Run

Follow these steps to get the project running locally.

### 1. Clone the repo

```bash
git clone https://github.com/vaibhavkulkarni943/Global-National-Bank-System-project.git
cd Global-National-Bank-System-project
```

### 2. Create the MySQL database and tables

Open MySQL client (or phpMyAdmin) and run the SQL below. Replace names if you prefer different ones.

```sql
-- create database
CREATE DATABASE bank_system;
USE bank_system;

-- users / accounts table (example)
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  full_name VARCHAR(200),
  email VARCHAR(150),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE accounts (
  account_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  account_number VARCHAR(50) NOT NULL UNIQUE,
  balance DECIMAL(15,2) DEFAULT 0.00,
  account_type VARCHAR(50),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE transactions (
  txn_id INT AUTO_INCREMENT PRIMARY KEY,
  account_id INT NOT NULL,
  type ENUM('DEPOSIT','WITHDRAW','TRANSFER') NOT NULL,
  amount DECIMAL(15,2) NOT NULL,
  note VARCHAR(255),
  txn_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (account_id) REFERENCES accounts(account_id) ON DELETE CASCADE
);
```

> 🔐 Tip: For local development you can create a dedicated DB user with limited privileges.

### 3. Add JDBC Driver

Download the MySQL JDBC connector (Connector/J) and put the `mysql-connector-java-<version>.jar` into your project's `WEB-INF/lib` folder or in Tomcat's `lib` folder.

If you use Maven, add to `pom.xml`:

```xml
<dependency>
  <groupId>mysql</groupId>
  <artifactId>mysql-connector-java</artifactId>
  <version>8.0.33</version>
</dependency>
```

### 4. Configure database connection

Locate the database configuration in your project (commonly a `db.properties`, `context.xml`, or a servlet helper class). Example `db.properties`:

```properties
db.url=jdbc:mysql://localhost:3306/bank_system?useSSL=false&serverTimezone=UTC
db.user=bank_user
db.password=your_password_here
```

Or use a Tomcat `context.xml` Resource for a connection pool:

```xml
<Resource name="jdbc/BankDB" auth="Container" type="javax.sql.DataSource"
          maxTotal="100" maxIdle="30" maxWaitMillis="10000"
          username="bank_user" password="your_password_here" driverClassName="com.mysql.cj.jdbc.Driver"
          url="jdbc:mysql://localhost:3306/bank_system?useSSL=false&serverTimezone=UTC"/>
```

> 📝 Make sure your code looks up `java:comp/env/jdbc/BankDB` if you use the Tomcat resource.

### 5. Build the project

If using Maven:

```bash
mvn clean package
```

This will generate a WAR under `target/`.

If not using any build tool, ensure your `.class` files and JSPs are in correct folders and the `WEB-INF/web.xml` is configured.

### 6. Deploy to Tomcat

* Copy the generated `yourapp.war` (or project folder) into `TOMCAT_HOME/webapps/`
* Start Tomcat: `TOMCAT_HOME/bin/startup.sh` (Linux/macOS) or `startup.bat` (Windows)
* Open browser: `http://localhost:8080/<context-path>/`

### 7. First-run: Create sample user

Use the app's registration page (if present) or insert a user manually:

```sql
INSERT INTO users (username, password, full_name, email) VALUES
('alice', 'alice_password_hash', 'Alice Example', 'alice@example.com');

-- create account for user_id 1
INSERT INTO accounts (user_id, account_number, balance, account_type) VALUES
(1, 'GBS0000001', 1000.00, 'SAVINGS');
```

> ⚠️ Passwords should be stored hashed (e.g., BCrypt). If your project stores plain text, add hashing before deploying.

---

## 🧪 How to Test

1. Register or create a user.
2. Login with credentials.
3. Create or view an account.
4. Try deposit / withdraw flows and verify `transactions` table updates.
5. Transfer funds between accounts and validate balances.

---

## 📁 Project Structure (example)

```
Global-National-Bank-System-project/
├─ src/
│  ├─ main/
│  │  ├─ java/ (servlets, DAO, models)
│  │  └─ webapp/
│  │     ├─ WEB-INF/
│  │     │  ├─ web.xml
│  │     │  └─ lib/ (jdbc driver)
│  │     └─ jsp/ (home.jsp, login.jsp, accounts.jsp)
├─ pom.xml (optional)
└─ README.md
```

---

## 🐞 Troubleshooting

* **`ClassNotFoundException: com.mysql.cj.jdbc.Driver`** → add MySQL connector JAR to `WEB-INF/lib` or Tomcat `lib`.
* **Cannot connect to DB** → check URL, username, password, and MySQL server running and firewall rules.
* **Session lost after login** → ensure cookies are enabled and session is not invalidated incorrectly.
* **HTTP 404 for JSP/Servlet** → confirm `web.xml` mappings or `@WebServlet` annotations and context path.

---

## 💡 Best Practices / Next Steps

* Use prepared statements to avoid SQL injection.
* Hash passwords (BCrypt or Argon2) and never store plain text passwords.
* Add server-side validation + input sanitization.
* Add connection pooling (Tomcat datasource) for performance.
* Add unit & integration tests.
* Consider using an ORM (JPA/Hibernate) for larger projects.

---

## 🤝 Contributing

Contributions are welcome! Please open an issue or submit a pull request with a clear description of the changes.

---

## 📝 License

Add your preferred license here (e.g., MIT). Example:

```
MIT License

Copyright (c) 2025 Vaibhav Kulkarni

Permission is hereby granted, free of charge, to any person obtaining a copy...
```

---

## 📬 Contact

If you need help or want to collaborate, reach out: `vaibhavkulkarni943` on GitHub.

---

❤️ Good luck! If you want, I can:

* ✅ generate a `db_init.sql` file with sample data
* ✅ produce a `.env` / `db.properties` template
* ✅ produce a CONTRIBUTING.md or LICENSE file

Tell me which one you want next!
