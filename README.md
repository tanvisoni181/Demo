# README

# GoTravel 

GoTravel is a web application built with Ruby on Rails that helps travel organizers manage their tours, collaborate with hotels for their specific tours. Travellers can book tours through bookings. Partner can register their hotels on our portal.

## Features
- User created by devise gem which has 3 type - organizer, traveller and partner using STI.
- Partners can register hotels, edit information, and delete hotel registrations.
- Partners can view thier registered hotels.
- Organizers can create, edit, and delete tour packages.
- Each tour package can have destination, images and other attributes.
- Organizer can collaborate with hotels for specific tours, can manage collaborations.
- Organizer can view thier all tours.
- Travellers can view available tours, browse destinations, and check the tour details.
- Travellers can book a tour and make payments securely.
- Travellers can view thier booked tours.

### Things you may want to cover:

* Ruby version - ruby-3.0.0

* Rails version - Rails 7.0.6

* Database - SQLite. Versions 3.8.0


### Getting Started
1. Clone the repository: https://github.com/tanvisoni181/Demo
    cd GoTravel

2. Install dependencies: bundle install 

3. Set up the database:  rails db:migrate 

4. Start the server: rails server 

5. Open your web browser and go to http://localhost:3000 to access the application.

6. Seed admin data: visit seed.rb file

## Usage
1. As an Partner, you can sign up and log in to manage hotels and registration of hotels. 
1. As an Organizer, you can sign up and log in to manage your tours and collaborations.
2. Create new tour packages and add destination, images and other attributes.
3. Booked hotels for created tour, add details of room_type and other attributes and create collaboration.
3. View the list of tours and manage their information.
4. As an Traveller, you can sign up and log in to browse available tours and book them.
5. Make secure payments for your bookings using integrated payment gateways(stripe).
6. Admin user have access to view users as an organizers, travellers and partners.
6. Admin user have access to view bookings, hotels and colaborations.

## Contact

If you have any questions or suggestions, feel free to open an issue or contact us at tanvi.soni@preciousinfosystem.com.
