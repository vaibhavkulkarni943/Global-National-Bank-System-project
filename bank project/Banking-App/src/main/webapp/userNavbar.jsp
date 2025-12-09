<style>
  .navbar {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 1rem 5%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 100;
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
            gap: 1.5rem;
            align-items: center;
        }

        .nav-links a, .nav-links button {
            text-decoration: none;
            color: var(--dark);
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s;
            background: none;
            border: none;
            cursor: pointer;
            font-size: 1rem;
        }

        .nav-links a:hover, .nav-links button:hover {
            color: var(--primary);
        }

        .logout-btn {
            background: var(--primary);
            color: black !important;
            padding: 8px 16px;
            border-radius: 6px;
        }

        .logout-btn:hover {
            background: var(--primary-dark) !important;
            transform: translateY(-2px);
        }

</style>
   <nav class="navbar">
        <div class="logo">
            <img src="https://cdn-icons-png.flaticon.com/512/477/477103.png" alt="Bank Logo">
            <span class="logo-text">Global National</span>
        </div>
        <div class="nav-links">
            <a href="Help.jsp"><i class="fas fa-phone"></i> Contact us</a>
            <form action="Logout" method="post">
                <button type="submit" class="logout-btn">
                    <i class="fas fa-right-from-bracket"></i> Logout
                </button>
            </form>
        </div>
    </nav>