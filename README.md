# AfroShop - Online Store

AfroShop is a modern e-commerce platform built with Laravel and Aimeos, designed to provide a seamless shopping experience for African-inspired products. The platform supports multiple payment gateways and includes features such as product reviews and an admin dashboard for managing products, discounts, and orders.

## Features

- **Product Management**: Add, edit, and delete products via the admin panel.
- **Discount System**: Admin can create and manage discounts for new sign-ups and returning users.
- **Shopping Cart**: Integrated Aimeos shopping cart for a smooth checkout experience.
- **Payment Gateways**:
  - PayPal
  - Stripe
  - MTN Mobile Money
  - Visa & Mastercard
- **User Reviews**: Customers can leave reviews and ratings on purchased products.
- **Secure Authentication**: User authentication and authorization with Laravel.
- **Admin Dashboard**: Manage products, orders, and user accounts.

## Tech Stack

- **Backend**: Laravel PHP Framework
- **E-commerce**: Aimeos
- **Database**: MySQL
- **Frontend**: Blade templates, Bootstrap
- **Payment Integrations**: PayPal, Stripe, MTN Mobile Money, Visa, Mastercard


## Installation

### Prerequisites

- PHP 8.0+
- Composer
- MySQL
- Node.js & npm
- Laravel CLI

### Steps

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/afroshop.git
   cd afroshop
   ```
2. Install dependencies:
   ```sh
   composer install
   npm install && npm run dev
   ```
3. Set up the `.env` file:
   ```sh
   cp .env.example .env
   ```
   Update database credentials and payment gateway keys in the `.env` file.
4. Run database migrations:
   ```sh
   php artisan migrate --seed
   ```
5. Start the development server:
   ```sh
   php artisan serve
   ```
6. Access the app at `http://localhost:8000`

## Contribution

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`feature-branch`).
3. Commit your changes.
4. Push to your fork and create a pull request.

## License

This project is licensed under the MIT License.

