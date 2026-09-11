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

    grid.innerHTML = result.map(car => `
        <article class="car-card">
            <div class="car-visual">
                <span class="tag">${car.tag}</span>
                <img src="${car.image}" alt="${car.brand} ${car.model}"
                     onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">
                <div class="vehicle-art">${car.icon}</div>
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
    `).join("");
}

function addToCart(id) {
    const car = cars.find(c => c.id === id);
    cart.push(car);
    document.getElementById("cartCount").textContent = cart.length;
}

function showDetails(id) {
    const car = cars.find(c => c.id === id);
    document.getElementById("modalContent").innerHTML = `
        <div style="border-radius:20px; overflow:hidden; margin-bottom:1rem; height:180px; background:#eef3f9;">
            <img src="${car.image}" alt="${car.model}"
                 style="width:100%; height:180px; object-fit:cover; display:block;"
                 onerror="this.style.display='none'; this.parentNode.innerHTML='<div style=\\'font-size:3rem;font-weight:800;padding:2rem;text-align:center;\\'>${car.icon}</div>';">
        </div>
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
