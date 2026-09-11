<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CarHub | Premium Cars</title>
    <link rel="stylesheet" href="styles.css">
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
        <button class="ghost" onclick="scrollToCars()">Explore Cars</button>
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

