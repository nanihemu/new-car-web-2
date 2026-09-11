<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CarHub | Premium Cars</title>
    <style>
        /* ----- global reset & fonts ----- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: system-ui, -apple-system, 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
            background: #f8fafc;
            color: #0b1a2e;
            line-height: 1.5;
        }

        /* ----- top bar ----- */
        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.9rem 2rem;
            background: #ffffff;
            border-bottom: 1px solid #e2e8f0;
            box-shadow: 0 2px 8px rgba(0,0,0,0.02);
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 0.8rem;
        }

        .logo {
            background: #0b1a2e;
            color: #fff;
            font-weight: 700;
            font-size: 1.3rem;
            width: 45px;
            height: 45px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            letter-spacing: 0.5px;
        }

        .brand h1 {
            font-size: 1.5rem;
            font-weight: 700;
            letter-spacing: -0.5px;
            line-height: 1.2;
        }

        .brand span {
            font-size: 0.75rem;
            color: #5b6f8a;
            font-weight: 400;
        }

        .top-actions {
            display: flex;
            gap: 0.75rem;
        }

        .ghost, .cart {
            padding: 0.6rem 1.2rem;
            border-radius: 40px;
            border: 1px solid #d0dae8;
            background: transparent;
            font-weight: 500;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.15s ease;
        }

        .ghost:hover {
            background: #f1f5f9;
            border-color: #a0b3cc;
        }

        .cart {
            background: #0b1a2e;
            color: white;
            border: none;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .cart span {
            background: #ffffff20;
            padding: 0.1rem 0.6rem;
            border-radius: 30px;
            font-weight: 600;
        }

        .cart:hover {
            background: #1e2f44;
        }

        /* ----- hero ----- */
        .hero {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 3.5rem 2rem 3rem;
            max-width: 1400px;
            margin: 0 auto;
            gap: 3rem;
        }

        .hero-copy .eyebrow {
            font-size: 0.8rem;
            letter-spacing: 2px;
            font-weight: 600;
            color: #3a6ea5;
            margin-bottom: 1rem;
        }

        .hero-copy h2 {
            font-size: 3.2rem;
            font-weight: 800;
            line-height: 1.1;
            letter-spacing: -1.5px;
            color: #0b1a2e;
            margin-bottom: 1.2rem;
        }

        .hero-copy h2 span {
            background: linear-gradient(145deg, #1e3b5c, #3f6b9e);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }

        .hero-text {
            font-size: 1.15rem;
            color: #2a4058;
            max-width: 450px;
            margin-bottom: 2rem;
        }

        .primary {
            background: #0b1a2e;
            color: white;
            padding: 0.9rem 2.2rem;
            border-radius: 40px;
            font-weight: 600;
            font-size: 1rem;
            border: none;
            cursor: pointer;
            transition: 0.15s;
            box-shadow: 0 8px 20px -6px rgba(11, 26, 46, 0.3);
        }

        .primary:hover {
            background: #1e2f44;
            transform: translateY(-1px);
        }

        .primary.wide {
            width: 100%;
            padding: 1rem;
            margin-top: 1.5rem;
        }

        /* hero car visual - with image */
        .hero-car {
            position: relative;
            width: 400px;
            height: 220px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .car-glow {
            position: absolute;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle at 30% 50%, rgba(64, 128, 255, 0.15), transparent 70%);
            border-radius: 50%;
            filter: blur(30px);
        }

        .car-silhouette {
            position: relative;
            font-weight: 800;
            font-size: 2.8rem;
            color: #1a2c40;
            background: linear-gradient(145deg, #ffffff, #eef3f9);
            padding: 1.5rem 2rem;
            border-radius: 60px;
            box-shadow: 0 25px 35px -10px rgba(0,0,0,0.2);
            border: 1px solid rgba(255,255,255,0.8);
            display: flex;
            flex-direction: column;
            align-items: center;
            letter-spacing: 4px;
            background-image: url('https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400&auto=format&fit=crop&q=60');
            background-size: cover;
            background-blend-mode: overlay;
            background-color: #dfe8f2;
            color: transparent;
            text-shadow: 0 0 0 #0b1a2e;
            width: 100%;
            height: 100%;
            justify-content: center;
            background-position: center;
        }

        /* fallback if image fails: still shows text */
        .car-silhouette::before {
            content: "SPORT";
            color: #0b1a2e;
            font-size: 2.2rem;
            font-weight: 800;
            background: rgba(255,255,255,0.7);
            padding: 0.4rem 1.2rem;
            border-radius: 40px;
            backdrop-filter: blur(4px);
            letter-spacing: 3px;
        }

        /* ----- stats ----- */
        .stats {
            display: flex;
            justify-content: space-between;
            max-width: 1200px;
            margin: 1rem auto 2rem;
            padding: 0 2rem;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .stats > div {
            background: white;
            padding: 1.2rem 2rem;
            border-radius: 24px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.02);
            border: 1px solid #eef2f6;
            display: flex;
            flex-direction: column;
            flex: 1 1 140px;
            text-align: center;
        }

        .stats strong {
            font-size: 1.8rem;
            font-weight: 700;
            color: #0b1a2e;
        }

        .stats span {
            color: #5a6f88;
            font-size: 0.9rem;
            font-weight: 500;
        }

        /* ----- catalog ----- */
        .catalog {
            max-width: 1400px;
            margin: 2rem auto 4rem;
            padding: 0 2rem;
        }

        .section-heading {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 2rem;
        }

        .section-heading h3 {
            font-size: 2rem;
            font-weight: 700;
            letter-spacing: -0.5px;
        }

        .result-count {
            color: #4a6a8a;
            font-weight: 500;
        }

        .filters {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            margin-bottom: 2.5rem;
        }

        .filters input, .filters select {
            padding: 0.8rem 1.2rem;
            border-radius: 40px;
            border: 1px solid #d0dae8;
            background: white;
            font-size: 0.95rem;
            font-weight: 500;
            color: #0b1a2e;
            outline: none;
            transition: 0.1s;
            flex: 1 1 180px;
        }

        .filters input:focus, .filters select:focus {
            border-color: #3a6ea5;
            box-shadow: 0 0 0 3px rgba(58,110,165,0.1);
        }

        /* car grid */
        .car-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 1.8rem;
        }

        .car-card {
            background: white;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 10px 25px -8px rgba(0,0,0,0.08);
            border: 1px solid #eef2f6;
            transition: transform 0.15s, box-shadow 0.2s;
            display: flex;
            flex-direction: column;
        }

        .car-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 20px 30px -10px rgba(0,0,0,0.12);
        }

        /* car visual — with real image from internet */
        .car-visual {
            position: relative;
            height: 180px;
            background: #e2eaf3;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }

        .car-visual img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.3s ease;
        }

        .car-card:hover .car-visual img {
            transform: scale(1.03);
        }

        .tag {
            position: absolute;
            top: 12px;
            left: 12px;
            background: rgba(11, 26, 46, 0.85);
            backdrop-filter: blur(4px);
            color: white;
            font-size: 0.7rem;
            font-weight: 700;
            letter-spacing: 1px;
            padding: 0.3rem 0.8rem;
            border-radius: 40px;
            z-index: 2;
        }

        /* vehicle art fallback (icon) – keep for safety, but image is primary */
        .vehicle-art {
            font-size: 2.5rem;
            font-weight: 800;
            color: #1f3b5a;
            display: none; /* hidden by default — image shows instead */
        }

        /* if image fails, show vehicle-art (we use onerror) */
        .car-visual img.error {
            display: none;
        }

        .car-visual img.error + .vehicle-art {
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.8rem;
            font-weight: 800;
            color: #0b1a2e;
            background: #d9e3ee;
            width: 100%;
            height: 100%;
        }

        .car-body {
            padding: 1.2rem 1.2rem 1.4rem;
            display: flex;
            flex-direction: column;
            gap: 0.7rem;
        }

        .meta {
            font-size: 0.75rem;
            font-weight: 600;
            color: #4b6e93;
            letter-spacing: 0.3px;
        }

        .car-body h4 {
            font-size: 1.2rem;
            font-weight: 700;
            letter-spacing: -0.3px;
            color: #0b1a2e;
        }

        .specs {
            display: flex;
            gap: 1rem;
            font-size: 0.8rem;
            color: #3d5a7a;
            background: #f0f5fb;
            padding: 0.4rem 1rem;
            border-radius: 40px;
            width: fit-content;
        }

        .card-bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 0.3rem;
        }

        .card-bottom strong {
            font-size: 1.3rem;
            font-weight: 700;
            color: #0b1a2e;
        }

        .card-bottom > div {
            display: flex;
            gap: 0.5rem;
        }

        .details, .add {
            padding: 0.5rem 1rem;
            border-radius: 40px;
            font-weight: 600;
            font-size: 0.8rem;
            border: 1px solid #d0dae8;
            background: white;
            cursor: pointer;
            transition: 0.1s;
        }

        .details:hover {
            background: #f1f5f9;
            border-color: #a0b3cc;
        }

        .add {
            background: #0b1a2e;
            color: white;
            border: none;
            width: 38px;
            height: 38px;
            font-size: 1.3rem;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0;
            border-radius: 50%;
        }

        .add:hover {
            background: #1e2f44;
        }

        .empty {
            grid-column: 1 / -1;
            text-align: center;
            padding: 3rem;
            background: #f0f5fb;
            border-radius: 40px;
            color: #4a6a8a;
            font-weight: 500;
        }

        /* modal */
        .modal {
            display: none;
            position: fixed;
            top: 0; left: 0; right: 0; bottom: 0;
            background: rgba(10, 20, 30, 0.6);
            backdrop-filter: blur(4px);
            align-items: center;
            justify-content: center;
            z-index: 1000;
            padding: 1rem;
        }

        .modal.open {
            display: flex;
        }

        .modal-card {
            background: white;
            max-width: 480px;
            width: 100%;
            border-radius: 32px;
            padding: 2rem 2rem 2rem;
            position: relative;
            box-shadow: 0 30px 50px -20px rgba(0,0,0,0.4);
            animation: fade 0.15s ease;
        }

        @keyframes fade {
            from { opacity: 0; transform: scale(0.97); }
            to { opacity: 1; transform: scale(1); }
        }

        .close {
            position: absolute;
            top: 1rem;
            right: 1.2rem;
            font-size: 2rem;
            background: none;
            border: none;
            cursor: pointer;
            color: #4a6a8a;
            line-height: 1;
        }

        .detail-visual {
            font-size: 2.2rem;
            font-weight: 800;
            background: #eef3f9;
            padding: 0.8rem 2rem;
            border-radius: 60px;
            text-align: center;
            margin-bottom: 1.5rem;
            color: #1f3b5a;
            display: inline-block;
        }

        .detail-price {
            font-size: 2rem;
            font-weight: 700;
            color: #0b1a2e;
            margin: 0.8rem 0;
        }

        .detail-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
            background: #f6f9fe;
            padding: 1.2rem;
            border-radius: 20px;
            margin: 1.2rem 0;
        }

        .detail-grid small {
            display: block;
            font-size: 0.7rem;
            color: #5b7a9a;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            font-weight: 600;
        }

        .detail-grid strong {
            font-size: 1rem;
            color: #0b1a2e;
        }

        /* footer */
        footer {
            background: white;
            border-top: 1px solid #e2e8f0;
            padding: 1.5rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #4a6a8a;
            font-size: 0.9rem;
            max-width: 1400px;
            margin: 2rem auto 0;
        }

        footer strong {
            color: #0b1a2e;
            font-size: 1.1rem;
        }

        /* responsive */
        @media (max-width: 900px) {
            .hero {
                flex-direction: column;
                text-align: center;
                padding: 2rem 1.5rem;
            }
            .hero-copy h2 {
                font-size: 2.5rem;
            }
            .hero-text {
                margin-left: auto;
                margin-right: auto;
            }
            .hero-car {
                width: 100%;
                max-width: 400px;
            }
            .topbar {
                flex-direction: column;
                gap: 1rem;
                align-items: stretch;
                padding: 1rem 1.5rem;
            }
            .brand {
                justify-content: center;
            }
            .top-actions {
                justify-content: center;
            }
            .stats {
                flex-wrap: wrap;
                padding: 0 1.5rem;
            }
            .catalog {
                padding: 0 1.5rem;
            }
            .section-heading {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }
            footer {
                flex-direction: column;
                gap: 0.5rem;
                text-align: center;
                padding: 1.5rem;
            }
        }

        @media (max-width: 500px) {
            .hero-copy h2 {
                font-size: 2rem;
            }
            .filters input, .filters select {
                flex: 1 1 100%;
            }
            .car-grid {
                grid-template-columns: 1fr;
            }
        }
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

<script>
    // ----- car data with real image URLs (from Unsplash) -----
    const cars = [
        {id:1, brand:"BMW", model:"M4 Competition", type:"Performance", price:89, year:2025, fuel:"Petrol", power:"503 HP", tag:"HOT", icon:"M4",
         image:"https://images.unsplash.com/photo-1555215695-3004980ad54e?w=600&auto=format&fit=crop&q=80"},
        {id:2, brand:"Mercedes", model:"AMG C 43", type:"Performance", price:76, year:2025, fuel:"Petrol", power:"402 HP", tag:"NEW", icon:"C43",
         image:"https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?w=600&auto=format&fit=crop&q=80"},
        {id:3, brand:"Audi", model:"RS5 Sportback", type:"Luxury", price:82, year:2024, fuel:"Petrol", power:"444 HP", tag:"POPULAR", icon:"RS5",
         image:"https://images.unsplash.com/photo-1603584173870-7f23fdae1b7a?w=600&auto=format&fit=crop&q=80"},
        {id:4, brand:"Toyota", model:"Fortuner Legender", type:"SUV", price:48, year:2025, fuel:"Diesel", power:"201 HP", tag:"VALUE", icon:"F",
         image:"https://images.unsplash.com/photo-1594502184342-2e12f4b6c1b5?w=600&auto=format&fit=crop&q=80"},
        {id:5, brand:"Porsche", model:"718 Cayman", type:"Sports", price:98, year:2024, fuel:"Petrol", power:"300 HP", tag:"SPORT", icon:"718",
         image:"https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=600&auto=format&fit=crop&q=80"},
        {id:6, brand:"Ford", model:"Mustang GT", type:"Muscle", price:74, year:2025, fuel:"Petrol", power:"480 HP", tag:"ICONIC", icon:"GT",
         image:"https://images.unsplash.com/photo-1580273916550-e323be2ae537?w=600&auto=format&fit=crop&q=80"},
        {id:7, brand:"BMW", model:"X5 xDrive40i", type:"SUV", price:97, year:2025, fuel:"Petrol", power:"335 HP", tag:"PREMIUM", icon:"X5",
         image:"https://images.unsplash.com/photo-1556189250-72ba954cfc2b?w=600&auto=format&fit=crop&q=80"},
        {id:8, brand:"Mercedes", model:"GLC 300", type:"SUV", price:71, year:2025, fuel:"Petrol", power:"255 HP", tag:"FAMILY", icon:"GLC",
         image:"https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?w=600&auto=format&fit=crop&q=80"},
        {id:9, brand:"Audi", model:"Q7 Premium Plus", type:"SUV", price:96, year:2024, fuel:"Petrol", power:"335 HP", tag:"LUXURY", icon:"Q7",
         image:"https://images.unsplash.com/photo-1603584173870-7f23fdae1b7a?w=600&auto=format&fit=crop&q=80"}
    ];

    let cart = [];

    function money(value) {
        return "₹" + value + "L";
    }

    // render cars with real images
    function renderCars() {
        const search = document.getElementById("search").value.toLowerCase();
        const brand = document.getElementById("brand").value;
        const price = document.getElementById("price").value;
        const sort = document.getElementById("sort").value;

        let result = cars.filter(car => {
            const matchesSearch = (car.brand + " " + car.model).toLowerCase().includes(search);
            const matchesBrand = brand === "all" || car.brand === brand;
            const matchesPrice = price === "all" || car.price <= Number(price);
            return matchesSearch && matchesBrand && matchesPrice;
        });

        if (sort === "low") result.sort((a,b) => a.price - b.price);
        if (sort === "high") result.sort((a,b) => b.price - a.price);

        document.getElementById("resultCount").textContent = result.length + " cars available";

        const grid = document.getElementById("carGrid");
        if (!result.length) {
            grid.innerHTML = '<div class="empty">No cars match your filters.</div>';
            return;
        }

        grid.innerHTML = result.map(car => {
            // fallback icon if image fails
            return `
            <article class="car-card">
                <div class="car-visual">
                    <span class="tag">${car.tag}</span>
                    <img src="${car.image}" alt="${car.brand} ${car.model}" 
                         onerror="this.classList.add('error'); this.nextElementSibling.style.display='flex';">
                    <div class="vehicle-art" style="display: none;">${car.icon}</div>
                </div>
                <div class="car-body">
                    <div class="meta">${car.type} • ${car.year}</div>
                    <h4>${car.brand} ${car.model}</h4>
                    <div class="specs">
                        <span>${car.fuel}</span>
                        <span>${car.power}</span>
                    </div>
                    <div class="card-bottom">
                        <strong>${money(car.price)}</strong>
                        <div>
                            <button class="details" onclick="showDetails(${car.id})">Details</button>
                            <button class="add" onclick="addToCart(${car.id})">+</button>
                        </div>
                    </div>
                </div>
            </article>
            `;
        }).join("");
    }

    function addToCart(id) {
        const car = cars.find(c => c.id === id);
        cart.push(car);
        document.getElementById("cartCount").textContent = cart.length;
    }

    function showDetails(id) {
        const car = cars.find(c => c.id === id);
        // use image in modal if possible, fallback to icon
        const modalImageHtml = `<div style="margin-bottom: 1rem; border-radius: 20px; overflow: hidden; max-height: 180px; display: flex; justify-content: center; background: #eef3f9;">
            <img src="${car.image}" alt="${car.model}" style="width:100%; height:180px; object-fit:cover; display:block;"
                 onerror="this.style.display='none'; this.parentNode.innerHTML='<div style=\\'font-size:3rem;font-weight:800;padding:2rem;\\'>${car.icon}</div>';">
        </div>`;

        document.getElementById("modalContent").innerHTML = `
            ${modalImageHtml}
            <p class="eyebrow">${car.brand} • ${car.type}</p>
            <h2>${car.model}</h2>
            <div class="detail-price">${money(car.price)}</div>
            <div class="detail-grid">
                <div><small>Year</small><strong>${car.year}</strong></div>
                <div><small>Fuel</small><strong>${car.fuel}</strong></div>
                <div><small>Power</small><strong>${car.power}</strong></div>
                <div><small>Availability</small><strong>In stock</strong></div>
            </div>
            <button class="primary wide" onclick="addToCart(${car.id}); closeModal()">Add to cart</button>
        `;
        document.getElementById("modal").classList.add("open");
    }

    function showCart() {
        if (!cart.length) {
            alert("Your cart is empty.");
            return;
        }
        const total = cart.reduce((sum, car) => sum + car.price, 0);
        alert("Cars in cart: " + cart.length + "\nEstimated total: " + money(total));
    }

    function closeModal(event) {
        if (!event || event.target.id === "modal" || event.target.classList.contains("close")) {
            document.getElementById("modal").classList.remove("open");
        }
    }

    function scrollToCars() {
        document.getElementById("cars").scrollIntoView({behavior:"smooth"});
    }

    document.addEventListener("DOMContentLoaded", renderCars);
</script>
</body>
</html>
