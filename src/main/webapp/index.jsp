<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CarHub | Premium Cars</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* ---- inline fallback styles (in case styles.css is missing) ---- */
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family: system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif; background:#f8fafc; color:#0b1a2e; line-height:1.5; }

        .topbar { display:flex; justify-content:space-between; align-items:center; padding:0.9rem 2rem; background:#fff; border-bottom:1px solid #e2e8f0; box-shadow:0 2px 8px rgba(0,0,0,0.02); }
        .brand { display:flex; align-items:center; gap:0.8rem; }
        .logo { background:#0b1a2e; color:#fff; font-weight:700; font-size:1.3rem; width:45px; height:45px; display:flex; align-items:center; justify-content:center; border-radius:12px; }
        .brand h1 { font-size:1.5rem; font-weight:700; line-height:1.2; }
        .brand span { font-size:0.75rem; color:#5b6f8a; }
        .top-actions { display:flex; gap:0.75rem; }
        .ghost, .cart { padding:0.6rem 1.2rem; border-radius:40px; border:1px solid #d0dae8; background:transparent; font-weight:500; font-size:0.9rem; cursor:pointer; }
        .ghost:hover { background:#f1f5f9; }
        .cart { background:#0b1a2e; color:#fff; border:none; display:flex; align-items:center; gap:8px; }
        .cart span { background:#ffffff20; padding:0.1rem 0.6rem; border-radius:30px; font-weight:600; }

        .hero { display:flex; align-items:center; justify-content:space-between; padding:3.5rem 2rem 3rem; max-width:1400px; margin:0 auto; gap:3rem; }
        .hero-copy .eyebrow { font-size:0.8rem; letter-spacing:2px; font-weight:600; color:#3a6ea5; margin-bottom:1rem; }
        .hero-copy h2 { font-size:3.2rem; font-weight:800; line-height:1.1; letter-spacing:-1.5px; margin-bottom:1.2rem; }
        .hero-copy h2 span { background:linear-gradient(145deg,#1e3b5c,#3f6b9e); -webkit-background-clip:text; background-clip:text; color:transparent; }
        .hero-text { font-size:1.15rem; color:#2a4058; max-width:450px; margin-bottom:2rem; }
        .primary { background:#0b1a2e; color:#fff; padding:0.9rem 2.2rem; border-radius:40px; font-weight:600; font-size:1rem; border:none; cursor:pointer; box-shadow:0 8px 20px -6px rgba(11,26,46,0.3); }
        .primary:hover { background:#1e2f44; }
        .primary.wide { width:100%; padding:1rem; margin-top:1.5rem; }

        .hero-car { position:relative; width:400px; height:220px; display:flex; align-items:center; justify-content:center; }
        .car-glow { position:absolute; width:100%; height:100%; background:radial-gradient(circle at 30% 50%, rgba(64,128,255,0.15), transparent 70%); border-radius:50%; filter:blur(30px); }
        .car-silhouette { position:relative; width:100%; height:100%; border-radius:60px; box-shadow:0 25px 35px -10px rgba(0,0,0,0.2); background:url('https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=600&auto=format&fit=crop&q=80') center/cover; display:flex; align-items:center; justify-content:center; color:#fff; font-weight:800; font-size:2rem; letter-spacing:3px; }

        .stats { display:flex; justify-content:space-between; max-width:1200px; margin:1rem auto 2rem; padding:0 2rem; gap:1rem; flex-wrap:wrap; }
        .stats > div { background:#fff; padding:1.2rem 2rem; border-radius:24px; box-shadow:0 4px 12px rgba(0,0,0,0.02); border:1px solid #eef2f6; display:flex; flex-direction:column; flex:1 1 140px; text-align:center; }
        .stats strong { font-size:1.8rem; font-weight:700; }
        .stats span { color:#5a6f88; font-size:0.9rem; font-weight:500; }

        .catalog { max-width:1400px; margin:2rem auto 4rem; padding:0 2rem; }
        .section-heading { display:flex; justify-content:space-between; align-items:flex-end; margin-bottom:2rem; }
        .section-heading h3 { font-size:2rem; font-weight:700; letter-spacing:-0.5px; }
        .result-count { color:#4a6a8a; font-weight:500; }
        .filters { display:flex; gap:1rem; flex-wrap:wrap; margin-bottom:2.5rem; }
        .filters input, .filters select { padding:0.8rem 1.2rem; border-radius:40px; border:1px solid #d0dae8; background:#fff; font-size:0.95rem; font-weight:500; color:#0b1a2e; outline:none; flex:1 1 180px; }

        .car-grid { display:grid; grid-template-columns:repeat(auto-fill, minmax(280px, 1fr)); gap:1.8rem; }
        .car-card { background:#fff; border-radius:24px; overflow:hidden; box-shadow:0 10px 25px -8px rgba(0,0,0,0.08); border:1px solid #eef2f6; transition:transform 0.15s, box-shadow 0.2s; display:flex; flex-direction:column; }
        .car-card:hover { transform:translateY(-4px); box-shadow:0 20px 30px -10px rgba(0,0,0,0.12); }

        .car-visual { position:relative; height:180px; background:#e2eaf3; display:flex; align-items:center; justify-content:center; overflow:hidden; }
        .car-visual img { width:100%; height:100%; object-fit:cover; display:block; transition:transform 0.3s ease; }
        .car-card:hover .car-visual img { transform:scale(1.05); }
        .tag { position:absolute; top:12px; left:12px; background:rgba(11,26,46,0.85); color:#fff; font-size:0.7rem; font-weight:700; letter-spacing:1px; padding:0.3rem 0.8rem; border-radius:40px; z-index:2; }
        .vehicle-art { font-size:2.8rem; font-weight:800; color:#1f3b5a; display:none; width:100%; height:100%; align-items:center; justify-content:center; }

        .car-body { padding:1.2rem 1.2rem 1.4rem; display:flex; flex-direction:column; gap:0.7rem; }
        .meta { font-size:0.75rem; font-weight:600; color:#4b6e93; }
        .car-body h4 { font-size:1.2rem; font-weight:700; }
        .specs { display:flex; gap:1rem; font-size:0.8rem; color:#3d5a7a; background:#f0f5fb; padding:0.4rem 1rem; border-radius:40px; width:fit-content; }
        .card-bottom { display:flex; justify-content:space-between; align-items:center; margin-top:0.3rem; }
        .card-bottom strong { font-size:1.3rem; font-weight:700; }
        .card-bottom > div { display:flex; gap:0.5rem; }
        .details, .add { padding:0.5rem 1rem; border-radius:40px; font-weight:600; font-size:0.8rem; border:1px solid #d0dae8; background:#fff; cursor:pointer; }
        .add { background:#0b1a2e; color:#fff; border:none; width:38px; height:38px; font-size:1.3rem; display:flex; align-items:center; justify-content:center; padding:0; border-radius:50%; }

        .empty { grid-column:1/-1; text-align:center; padding:3rem; background:#f0f5fb; border-radius:40px; color:#4a6a8a; font-weight:500; }

        .modal { display:none; position:fixed; inset:0; background:rgba(10,20,30,0.6); backdrop-filter:blur(4px); align-items:center; justify-content:center; z-index:1000; padding:1rem; }
        .modal.open { display:flex; }
        .modal-card { background:#fff; max-width:480px; width:100%; border-radius:32px; padding:2rem; position:relative; box-shadow:0 30px 50px -20px rgba(0,0,0,0.4); }
        .close { position:absolute; top:1rem; right:1.2rem; font-size:2rem; background:none; border:none; cursor:pointer; color:#4a6a8a; }
        .detail-visual { font-size:2.2rem; font-weight:800; background:#eef3f9; padding:0.8rem 2rem; border-radius:60px; text-align:center; margin-bottom:1.5rem; }
        .detail-price { font-size:2rem; font-weight:700; margin:0.8rem 0; }
        .detail-grid { display:grid; grid-template-columns:1fr 1fr; gap:1rem; background:#f6f9fe; padding:1.2rem; border-radius:20px; margin:1.2rem 0; }
        .detail-grid small { display:block; font-size:0.7rem; color:#5b7a9a; text-transform:uppercase; font-weight:600; }
        .detail-grid strong { font-size:1rem; }

        footer { background:#fff; border-top:1px solid #e2e8f0; padding:1.5rem 2rem; display:flex; justify-content:space-between; align-items:center; color:#4a6a8a; font-size:0.9rem; max-width:1400px; margin:2rem auto 0; }
    </style>
</head>
<body>
<header class="topbar">
    <div class="brand">
        <div class="logo">CH</div>
        <div>
            <h1>CarHub</h1>
            <span>Drive what inspires you</span>
        </div>
    </div>
    <div class="top-actions">
        <button class="ghost" onclick="scrollToCars()">Explore Premium Cars</button>
        <button class="cart" onclick="showCart()">Cart <span id="cartCount">0</span></button>
    </div>
</header>

<main>
    <section class="hero">
        <div class="hero-copy">
            <p class="eyebrow">PREMIUM CAR MARKETPLACE</p>
            <h2>Find the car that<br><span>fits your drive.</span></h2>
            <p class="hero-text">Browse performance, luxury and everyday cars in one clean marketplace.</p>
            <button class="primary" onclick="scrollToCars()">Browse Inventory</button>
        </div>
        <div class="hero-car">
            <div class="car-glow"></div>
            <div class="car-silhouette">SPORT</div>
        </div>
    </section>

    <section class="stats">
        <div><strong>24+</strong><span>Cars listed</span></div>
        <div><strong>12</strong><span>Brands</span></div>
        <div><strong>4.9/5</strong><span>Buyer rating</span></div>
        <div><strong>24/7</strong><span>Online support</span></div>
    </section>

    <section id="cars" class="catalog">
        <div class="section-heading">
            <div>
                <p class="eyebrow">INVENTORY</p>
                <h3>Featured cars</h3>
            </div>
            <p id="resultCount" class="result-count"></p>
        </div>

        <div class="filters">
            <input id="search" type="search" placeholder="Search model or brand..." oninput="renderCars()">
            <select id="brand" onchange="renderCars()">
                <option value="all">All brands</option>
                <option value="BMW">BMW</option>
                <option value="Mercedes">Mercedes</option>
                <option value="Audi">Audi</option>
                <option value="Toyota">Toyota</option>
                <option value="Porsche">Porsche</option>
                <option value="Ford">Ford</option>
                <option value="Tata">Tata</option>
                <option value="Kia">Kia</option>
            </select>
            <select id="price" onchange="renderCars()">
                <option value="all">Any budget</option>
                <option value="50">Under ₹50L</option>
                <option value="80">Under ₹80L</option>
                <option value="120">Under ₹1.2Cr</option>
            </select>
            <select id="sort" onchange="renderCars()">
                <option value="featured">Featured</option>
                <option value="low">Price: Low to High</option>
                <option value="high">Price: High to Low</option>
            </select>
        </div>

        <div id="carGrid" class="car-grid"></div>
    </section>
</main>

<div id="modal" class="modal" onclick="closeModal(event)">
    <div class="modal-card">
        <button class="close" onclick="closeModal()">×</button>
        <div id="modalContent"></div>
    </div>
</div>

<footer>
    <strong>CarHub</strong>
    <span>Demo project for Jenkins • Maven • Nexus • Tomcat</span>
</footer>

<script src="script.js"></script>
</body>
</html>
