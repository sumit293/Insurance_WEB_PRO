<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Welcome Portal</title>
  <style>
    :root {
      --bg-color: #121212;
      --text-color: #e0e0e0;
      --link-color: #bb86fc;
      --hover-bg: #bb86fc;
      --hover-text: #121212;
    }

    body {
      background-color: var(--bg-color);
      color: var(--text-color);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 20px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      text-align: center;
      overflow: hidden;
      position: relative;
      transition: background 0.5s, color 0.5s;
    }

    h2 {
      font-size: 4rem;
      margin-bottom: 40px;
      z-index: 2;
      animation: fadeInGlow 2s ease-in-out forwards;
    }

    .link-container {
      display: flex;
      flex-direction: column;
      gap: 25px;
      z-index: 2;
    }

    .link-container a {
      color: var(--link-color);
      text-decoration: none;
      font-size: 1.5rem;
      padding: 10px 20px;
      border: 2px solid var(--link-color);
      border-radius: 50px;
      transition: all 0.3s ease;
      opacity: 0;
      animation: fadeInUp 0.5s ease-out forwards;
      text-transform: uppercase;
      letter-spacing: 1px;
      font-weight: bold;
    }

    .link-container a:nth-child(1) { animation-delay: 0.8s; }
    .link-container a:nth-child(2) { animation-delay: 1.0s; }
    .link-container a:nth-child(3) { animation-delay: 1.2s; }

    .link-container a:hover {
      background-color: var(--hover-bg);
      color: var(--hover-text);
      transform: scale(1.1);
      box-shadow: 0 0 20px var(--link-color);
    }

    @keyframes fadeInGlow {
      from {
        opacity: 0;
        text-shadow: 0 0 10px #fff, 0 0 20px #fff, 0 0 30px var(--link-color);
      }
      to {
        opacity: 1;
        text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px var(--link-color), 0 0 20px var(--link-color);
      }
    }

    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .money {
      position: absolute;
      font-size: 24px;
      animation: floatMoney 8s linear infinite;
      user-select: none;
      pointer-events: none;
    }

    @keyframes floatMoney {
      0% {
        transform: translateY(100vh) rotate(0deg);
        opacity: 1;
      }
      100% {
        transform: translateY(-200px) rotate(720deg);
        opacity: 0;
      }
    }

    #themeToggle {
      position: fixed;
      top: 20px;
      right: 20px;
      z-index: 10;
      background: var(--link-color);
      color: var(--hover-text);
      border: none;
      padding: 10px 20px;
      border-radius: 20px;
      cursor: pointer;
      font-weight: bold;
      transition: 0.3s;
    }

    #themeToggle:hover {
      box-shadow: 0 0 10px var(--link-color);
      transform: scale(1.05);
    }
  </style>
</head>
<body>

  <button id="themeToggle">Switch Theme</button>

  <h2>LLIC POLICIES </h2>

  <div class="link-container">
    <a href="admin">Go to Admin Login</a>
    <a href="AgentLogin">Go to Agent Login</a>
    <a href="PolicyHolderLogin">Policy Holder Login</a>
  </div>

  <script>
    // Floating 💸 generator
    function createMoney() {
      const money = document.createElement("div");
      money.classList.add("money");
      money.textContent = "💸";
      money.style.left = Math.random() * 100 + "vw";
      money.style.fontSize = Math.random() * 20 + 20 + "px";
      money.style.animationDuration = (Math.random() * 5 + 5) + "s";

      document.body.appendChild(money);

      setTimeout(() => {
        money.remove();
      }, 10000);
    }

    setInterval(createMoney, 300); // Generate 💸 every 300ms

    // Theme toggle
    const btn = document.getElementById("themeToggle");
    let darkMode = true;

    btn.addEventListener("click", () => {
      darkMode = !darkMode;

      if (darkMode) {
        document.documentElement.style.setProperty('--bg-color', '#121212');
        document.documentElement.style.setProperty('--text-color', '#e0e0e0');
        document.documentElement.style.setProperty('--link-color', '#bb86fc');
        document.documentElement.style.setProperty('--hover-bg', '#bb86fc');
        document.documentElement.style.setProperty('--hover-text', '#121212');
        btn.textContent = "Switch Theme";
      } else {
        document.documentElement.style.setProperty('--bg-color', '#ffffff');
        document.documentElement.style.setProperty('--text-color', '#111111');
        document.documentElement.style.setProperty('--link-color', '#6200ee');
        document.documentElement.style.setProperty('--hover-bg', '#6200ee');
        document.documentElement.style.setProperty('--hover-text', '#ffffff');
        btn.textContent = "Switch Back";
      }
    });
  </script>

</body>
</html>
