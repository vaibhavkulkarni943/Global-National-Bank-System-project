
<%@page isELIgnored="false"%>
<style>

        .navbar {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .logo img {
            height: 40px;
        }

        .logo-text {
            font-weight: 700;
            font-size: 1.5rem;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--dark);
            font-weight: 500;
            transition: color 0.3s;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .nav-links a:hover {
            color: var(--primary);
        }


</style>
    <nav class="navbar">
        <div class="logo">
            <img src="https://cdn-icons-png.flaticon.com/512/477/477103.png" alt="Bank Logo">
            <span class="logo-text"><a href="Index.jsp">Global National</a> </span>
        </div>
        <div class="nav-links">
            <a href="Index.jsp"><i class="fas fa-home"></i> Home</a>
            <a href="Condition.jsp"><i class="fas fa-university"></i> About</a>
            <a href="Products.jsp"><i class="fas fa-credit-card"></i> Products</a>
            <a href="Contact.jsp"><i class="fas fa-phone-alt"></i> Contact</a>
        </div>
    </nav>