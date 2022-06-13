# Mandopedia - The Mandalorian Wiki by Juandemarr
My final project for my superior grade in web developing apps. This project is focus on investigating new ways and more complex designs.

## Functional Description
A wiki where you can see publications and edit them.

As an admin you can create, edit and delete categories, publications and users (less the password). You can aprove or disapprove editions of publications already made.

As a writter you can approve editions by users (using ajax) and create publications.

As an user you can edit publications, edit your profile and delete your account.

There is a notification system with noty.

## Design Description
There's a video at start, control by cookies. The publications have 3D images, and the footer links use animate.css

The cards of the characters have a 3D transform while passing the mouse over them.

Use of parallax.

## Technologies used
Symfony6 (easy-admin for the panel administration), Materialize, Sass, jQuery, JS and Adobe XD for the mockups. The deploy was made on AWS using ubuntu with nginx.

## Usage

To install: composer install

To compile the Sass: npm run watch

To run the server on local: symfony server:start