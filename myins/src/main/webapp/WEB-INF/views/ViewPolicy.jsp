<%@page import="com.r3sys.model.policy"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Policies</title>
    <style>
        /* --- Base & Neon Theme --- */
        :root {
            --bg-color: #000000;
            --border-color: #2a2a2a;
            --text-color: #e0e0e0;
            --neon-blue: #00bfff;
            --neon-pink: #ff00ff;
            --neon-green: #39ff14;
            --shadow-blue: rgba(0, 191, 255, 0.5);
            --shadow-pink: rgba(255, 0, 255, 0.5);
            --shadow-green: rgba(57, 255, 20, 0.5);
        }

        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            font-family: 'Consolas', 'Menlo', 'monospace';
            background-color: var(--bg-color);
            color: var(--text-color);
            overflow-x: hidden;
        }

        /* --- Main Content & Table Container --- */
        .container {
            padding: 2rem;
            max-width: 1400px;
            margin: 2rem auto;
            animation: fade-in 1s ease-out;
        }
        
        @keyframes fade-in {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .page-title {
            font-size: 3rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 2.5rem;
            text-align: center;
            text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 20px var(--neon-blue), 0 0 30px var(--neon-blue);
        }
        
        /* --- Neon Table Styling --- */
        .table-wrapper {
            border: 2px solid var(--neon-blue);
            border-radius: 10px;
            padding: 5px;
            box-shadow: 0 0 15px var(--shadow-blue), inset 0 0 15px var(--shadow-blue);
        }
        
        .neon-table {
            width: 100%;
            border-collapse: collapse;
        }
        
        .neon-table th, .neon-table td {
            padding: 16px 18px;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
            word-wrap: break-word; /* Fix for long text */
        }

        .neon-table thead {
            border-bottom: 2px solid var(--neon-blue);
        }
        
        .neon-table th {
            color: var(--neon-blue);
            text-transform: uppercase;
            letter-spacing: 1px;
            text-shadow: 0 0 5px var(--shadow-blue);
            white-space: nowrap;
        }
        
        .neon-table tbody tr {
            transition: background-color 0.3s ease;
        }
        
        .neon-table tbody tr:hover {
            background-color: rgba(0, 191, 255, 0.05);
        }
        
        .neon-table tbody tr:last-child td {
            border-bottom: none;
        }
        
        /* --- Action Links --- */
        .action-link {
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
            padding: 5px 10px;
            border-radius: 5px;
            margin: 0 2px;
            display: inline-block;
            white-space: nowrap;
        }
        
        .update-link {
            color: var(--neon-blue);
            border: 1px solid var(--neon-blue);
        }
        .update-link:hover {
            background-color: var(--neon-blue);
            color: var(--bg-color);
            box-shadow: 0 0 15px var(--shadow-blue);
        }
        
        .delete-link {
            color: var(--neon-pink);
            border: 1px solid var(--neon-pink);
        }
        .delete-link:hover {
            background-color: var(--neon-pink);
            color: var(--bg-color);
            box-shadow: 0 0 15px var(--shadow-pink);
        }

        /* --- Game Section --- */
        .game-section {
            margin: 8rem auto;
            text-align: center;
            max-width: 600px;
        }
        .game-title {
            font-size: 2.5rem;
            color: var(--neon-green);
            text-shadow: 0 0 15px var(--shadow-green);
            margin-bottom: 1rem;
        }
        #score-display {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            color: #fff;
        }
        #gameCanvas {
            background-color: #050505;
            border: 2px solid var(--neon-green);
            box-shadow: 0 0 20px var(--shadow-green);
            max-width: 100%;
            cursor: none; /* Hide cursor over canvas */
        }
        .game-btn {
            margin-top: 1.5rem;
            padding: 10px 25px;
            font-family: inherit;
            font-size: 1.2rem;
            color: var(--bg-color);
            background-color: var(--neon-green);
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            box-shadow: 0 0 20px var(--shadow-green);
            transition: all 0.3s ease;
        }
        .game-btn:hover {
            transform: scale(1.05);
        }

        /* --- Responsive Design for the large table (IMPROVED) --- */
        @media screen and (max-width: 1200px) {
            .neon-table thead { display: none; }
            .neon-table, .neon-table tbody, .neon-table tr, .neon-table td { display: block; width: 100%; box-sizing: border-box; }
            .neon-table tr {
                margin-bottom: 20px;
                border: 1px solid var(--border-color);
                border-radius: 8px;
                box-shadow: 0 0 5px rgba(255,255,255,0.1);
            }
            .neon-table td {
                text-align: right;
                position: relative;
                padding-top: 35px; /* Add space for label on top */
                border-bottom: 1px solid var(--border-color);
            }
            .neon-table td:last-child {
                border-bottom: none;
            }
            .neon-table td::before {
                content: attr(data-label);
                position: absolute;
                top: 8px; /* Position label at the top */
                left: 15px;
                width: auto;
                text-align: left;
                font-weight: bold;
                color: var(--neon-blue);
                text-transform: uppercase;
                font-size: 0.8em;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="page-title">All Policies</h1>
    <div class="table-wrapper">
        <table class="neon-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Holder Name</th>
                    <th>DOB</th>
                    <th>Contact</th>
                    <th>Holder Email</th>
                    <th>Policy Title</th>
                    <th>Policy Detail</th>
                    <th>Due Date</th>
                    <th>Agent Email</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<policy> allPolicies = (List<policy>) request.getAttribute("allPolicies");
                    if (allPolicies != null && !allPolicies.isEmpty()) {
                        for (policy p : allPolicies) {
                %>
                <tr>
                    <td data-label="Policy ID"><%= p.getId() %></td>
                    <td data-label="Holder Name"><%= p.getHolderName() %></td>
                    <td data-label="DOB"><%= p.getDob() %></td>
                    <td data-label="Contact"><%= p.getContact() %></td>
                    <td data-label="Holder Email"><%= p.getPhEmail() %></td>
                    <td data-label="Policy Title"><%= p.getPolicyTitle() %></td>
                    <td data-label="Policy Detail"><%= p.getPolicyDetail() %></td>
                    <td data-label="Due Date"><%= p.getDueDate() %></td>
                    <td data-label="Agent Email"><%= p.getIaEmail() %></td>
                    <td data-label="Update"><a class="action-link update-link" href="UpdatePolicy?pid=<%= p.getId() %>">Update</a></td>
                    <td data-label="Delete"><a class="action-link delete-link" href="DeletePolicy?pid=<%= p.getId() %>">Delete</a></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="11" style="text-align: center; padding: 40px; font-size: 1.2rem;">No policies found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<div class="game-section">
    <h2 class="game-title">-- Mouse Snake --</h2>
    <p id="score-display">Score: <span id="score">0</span></p>
    <canvas id="gameCanvas" width="400" height="400"></canvas>
    <button id="startGameBtn" class="game-btn">Start Game</button>
</div>

<script>
    // --- Snake Game Logic (Mouse Controlled) ---
    const canvas = document.getElementById('gameCanvas');
    const ctx = canvas.getContext('2d');
    const startGameBtn = document.getElementById('startGameBtn');
    const scoreEl = document.getElementById('score');

    const gridSize = 20;
    let snake, food, score, direction, gameInterval, mousePos = { x: 0, y: 0 };

    function init() {
        snake = [{ x: 10, y: 10 }];
        food = {};
        score = 0;
        direction = 'right';
        scoreEl.textContent = '0';
        placeFood();
        if (gameInterval) clearInterval(gameInterval);
    }

    function placeFood() {
        food.x = Math.floor(Math.random() * (canvas.width / gridSize));
        food.y = Math.floor(Math.random() * (canvas.height / gridSize));
    }

    function draw() {
        ctx.fillStyle = '#050505';
        ctx.fillRect(0, 0, canvas.width, canvas.height);
        
        // Draw mouse cursor hint
        ctx.fillStyle = 'rgba(255, 255, 255, 0.2)';
        ctx.beginPath();
        ctx.arc(mousePos.x, mousePos.y, 8, 0, Math.PI * 2);
        ctx.fill();

        // Draw snake
        snake.forEach(segment => {
            ctx.fillStyle = 'lime';
            ctx.fillRect(segment.x * gridSize, segment.y * gridSize, gridSize - 1, gridSize - 1);
        });

        // Draw food
        ctx.fillStyle = 'red';
        ctx.fillRect(food.x * gridSize, food.y * gridSize, gridSize, gridSize);
    }

    function update() {
        const head = { ...snake[0] };
        switch (direction) {
            case 'up': head.y--; break;
            case 'down': head.y++; break;
            case 'left': head.x--; break;
            case 'right': head.x++; break;
        }

        if (head.x < 0 || head.x * gridSize >= canvas.width || head.y < 0 || head.y * gridSize >= canvas.height) {
            return gameOver();
        }

        for (let i = 1; i < snake.length; i++) {
            if (head.x === snake[i].x && head.y === snake[i].y) {
                return gameOver();
            }
        }
        
        snake.unshift(head);

        if (head.x === food.x && head.y === food.y) {
            score++;
            scoreEl.textContent = score;
            placeFood();
        } else {
            snake.pop();
        }
        draw();
    }

    function gameOver() {
        clearInterval(gameInterval);
        ctx.fillStyle = "rgba(0, 0, 0, 0.7)";
        ctx.fillRect(0, 0, canvas.width, canvas.height);
        ctx.fillStyle = "white";
        ctx.font = "30px 'Consolas'";
        ctx.textAlign = "center";
        ctx.fillText("Game Over", canvas.width / 2, canvas.height / 2 - 20);
        ctx.fillText("Score: " + score, canvas.width / 2, canvas.height / 2 + 20);
    }

    function changeDirectionWithMouse(e) {
        const rect = canvas.getBoundingClientRect();
        mousePos.x = e.clientX - rect.left;
        mousePos.y = e.clientY - rect.top;

        const headX = snake[0].x * gridSize + gridSize / 2;
        const headY = snake[0].y * gridSize + gridSize / 2;
        
        const dx = mousePos.x - headX;
        const dy = mousePos.y - headY;
        
        // Change direction based on which axis has a larger difference
        if (Math.abs(dx) > Math.abs(dy)) {
            // Prioritize horizontal movement
            if (dx > 0 && direction !== 'left') {
                direction = 'right';
            } else if (dx < 0 && direction !== 'right') {
                direction = 'left';
            }
        } else {
            // Prioritize vertical movement
            if (dy > 0 && direction !== 'up') {
                direction = 'down';
            } else if (dy < 0 && direction !== 'down') {
                direction = 'up';
            }
        }
    }
    
    startGameBtn.addEventListener('click', () => {
        init();
        gameInterval = setInterval(update, 150);
    });
    
    // Add mouse move listener instead of keydown
    canvas.addEventListener('mousemove', changeDirectionWithMouse);
    
    // Initial drawing before game starts
    init();
    draw();
</script>

</body>
</html>