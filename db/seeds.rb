# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Trips
Trip.create(user_id: 1, title: "New York", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/New_york_times_square-terabass.jpg/800px-New_york_times_square-terabass.jpg", start_time:'2024-12-22 10:50:00', end_time:'2024-01-03 14:15:00')
Trip.create(user_id: 2, title: "Frisco to San Diego", image_url: "https://i.pinimg.com/736x/ec/eb/5f/eceb5f9093498073ff1dcca1b0ec06af.jpg", start_time:'2025-06-01 10:00:00', end_time:'2025-06-14 21:00:00')

# Places
Place.create(trip_id:	4, address: "210 West 46th Street, New York, NY 10036", name: "Marquis Theatre", description: "Elf the Musical", image_url: "https://elfthemusicaltour.com/ELF_NewLogo_Final_RGB.png", start_time: "2024-12-23 19:00:00", end_time: "2024-12-23 23:00:00")
Place.create(trip_id:	4, address:"45 Rockefeller Plaza, New York, NY 10111" , name:"Rockefeller Center" , description:"Ice skating" , image_url:"https://media.timeout.com/images/105721382/750/562/image.jpg" , start_time:"2024-12-27 13:00:00" , end_time:"2024-12-27 15:00:00")
Place.create(trip_id: 5, address:"Sante Fe, NM" , name:"Santa Fe" , description:"Fun artsy city full of navajo culture" , image_url:"https://livability.com/wp-content/uploads/2019/01/SantaFeNM-StFrancisBasilica.jpg.webp" , start_time:"2025-06-01 20:00:00" , end_time:"2025-06-03 10:00:00")
Place.create(trip_id: 5, address:"Moab, UT" , name:"Moab" , description:"Super unique rock formations" , image_url:"https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/33/f3/5e/caption.jpg?w=1400&h=1400&s=1" , start_time:"2025-06-03 18:00:00" , end_time:"2025-06-05 8:00:00")
Place.create(trip_id: 5, address:"Springdale, UT" , name:"Zion" , description:"Zion National Park" , image_url:"https://cdn.greaterzion.com/wp-content/uploads/2019/03/29133427/zionnationalpark-jdp-144-e1572643894133_1920.jpg" , start_time:"2025-06-05 11:00:00" , end_time:"2025-06-05 16:00:00")
Place.create(trip_id: 5, address:"Las Vegas, Nevada" , name:"Las Vegas" , description:"Lights!" , image_url:"https://www.hertz.com/content/dam/hertz/global/blog-articles/things-to-do/las-vegas-neighborhoods/las-vegas-neighborhoods-header.jpg" , start_time:"2025-06-05 19:00:00" , end_time:"2025-06-06 12:00:00")
Place.create(trip_id: 5, address:"San Diego, CA" , name:"San Diego" , description:"Beach and fish tacos" , image_url:"https://i.ytimg.com/vi/vtXkkUqou9U/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDSim1DQnMmmG9F9Pa2Is5alnm-Pw" , start_time:"2025-06-06 21:00:00" , end_time:"2025-06-10 10:00:00")
Place.create(trip_id: 5, address:"Phoenix, AZ" , name:"Phoenix" , description:"Camelback Mountain" , image_url:"https://lp-cms-production.imgix.net/2024-06/GettyImages-1288752517.jpg?w=1440&h=810&fit=crop&auto=format&q=75" , start_time:"2025-06-10 15:00:00" , end_time:"2025-06-11 14:00:00")
Place.create(trip_id: 5, address:"Silver City, NM" , name:"Silver City" , description:"Check out the history" , image_url:"https://www.rent.com/blog/wp-content/uploads/2024/09/Shutterstock-pc-silci-hero.jpg" , start_time:"2025-06-11 20:00:00" , end_time:"2025-06-12 10:00:00")
Place.create(trip_id: 5, address:"Frisco, TX" , name:"Frisco" , description:"Home sweet home" , image_url:"https://www.southernliving.com/thmb/GYMNAAFsYs2yVU92c2prxgdjcDc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/downtown-in-the-fall_roger-robinson_submitted-for-inaugural-2010-cvb-photo-contest-37beaf6e5056a36_37beb255-5056-a36a-07fa8701c5c57a17-1-ecfa390d65b54fb395e4b22dda312022.jpg" , start_time:"2025-06-12 20:00:00" , end_time:"2025-06-12 20:00:00")