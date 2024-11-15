# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

##################################################################
# User 1
User.create(name: "bob",
email: "bob@bob.com", password: "password", password_confirmation: "password")

# First Trip for User 1
Trip.create(user_id: 1, title: "New York", image_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/New_york_times_square-terabass.jpg/800px-New_york_times_square-terabass.jpg", start_time:'2024-12-22 10:50:00', end_time:'2024-01-03 14:15:00')
# Places
Place.create(trip_id:	1, address: "210 West 46th Street, New York, NY 10036", name: "Marquis Theatre", description: "Elf the Musical", image_url: "https://elfthemusicaltour.com/ELF_NewLogo_Final_RGB.png", start_time: "2024-12-23 19:00:00", end_time: "2024-12-23 23:00:00")
Place.create(trip_id:	1, address:"45 Rockefeller Plaza, New York, NY 10111" , name:"Rockefeller Center" , description:"Ice skating" , image_url:"https://media.timeout.com/images/105721382/750/562/image.jpg" , start_time:"2024-12-27 13:00:00" , end_time:"2024-12-27 15:00:00")

# Next Trip for User 1
Trip.create(user_id: 1,
title: "Seattle",
image_url:
 "https://uploads.visitseattle.org/2023/01/11122537/Banner_rachael-jones-media_aerial-destination-photos-24_3.jpg",
start_time: 'Tue, 01 Jul 2025',
end_time: 'Fri, 11 Jul 2025'
)
# Places
# THESE WILL HAVE A TRIP ID OF 2

##################################################################
# User 2
User.create(name: "doug",
email: "doug@doug.com", password: "password", password_confirmation: "password")

# First Trip for User 2
Trip.create(user_id: 2, title: "Frisco to San Diego", image_url: "https://i.pinimg.com/736x/ec/eb/5f/eceb5f9093498073ff1dcca1b0ec06af.jpg", start_time:'2025-06-01 10:00:00', end_time:'2025-06-14 21:00:00')
# Places
Place.create(trip_id: FILL_ME_IN_LATER, address:"Sante Fe, NM" , name:"Santa Fe" , description:"Fun artsy city full of navajo culture" , image_url:"https://livability.com/wp-content/uploads/2019/01/SantaFeNM-StFrancisBasilica.jpg.webp" , start_time:"2025-06-01 20:00:00" , end_time:"2025-06-03 10:00:00")
Place.create(trip_id: FILL_ME_IN_LATER, address:"Moab, UT" , name:"Moab" , description:"Super unique rock formations" , image_url:"https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/33/f3/5e/caption.jpg?w=1400&h=1400&s=1" , start_time:"2025-06-03 18:00:00" , end_time:"2025-06-05 8:00:00")
Place.create(trip_id: FILL_ME_IN_LATER, address:"Springdale, UT" , name:"Zion" , description:"Zion National Park" , image_url:"https://cdn.greaterzion.com/wp-content/uploads/2019/03/29133427/zionnationalpark-jdp-144-e1572643894133_1920.jpg" , start_time:"2025-06-05 11:00:00" , end_time:"2025-06-05 16:00:00")
Place.create(trip_id: FILL_ME_IN_LATER, address:"Las Vegas, Nevada" , name:"Las Vegas" , description:"Lights!" , image_url:"https://www.hertz.com/content/dam/hertz/global/blog-articles/things-to-do/las-vegas-neighborhoods/las-vegas-neighborhoods-header.jpg" , start_time:"2025-06-05 19:00:00" , end_time:"2025-06-06 12:00:00")
Place.create(trip_id: FILL_ME_IN_LATER, address:"San Diego, CA" , name:"San Diego" , description:"Beach and fish tacos" , image_url:"https://i.ytimg.com/vi/vtXkkUqou9U/hq720.jpg?sqp=-oaymwEhCK4FEIIDSFryq4qpAxMIARUAAAAAGAElAADIQj0AgKJD&rs=AOn4CLDSim1DQnMmmG9F9Pa2Is5alnm-Pw" , start_time:"2025-06-06 21:00:00" , end_time:"2025-06-10 10:00:00")
Place.create(trip_id: FILL_ME_IN_LATER, address:"Phoenix, AZ" , name:"Phoenix" , description:"Camelback Mountain" , image_url:"https://lp-cms-production.imgix.net/2024-06/GettyImages-1288752517.jpg?w=1440&h=810&fit=crop&auto=format&q=75" , start_time:"2025-06-10 15:00:00" , end_time:"2025-06-11 14:00:00")
Place.create(trip_id: FILL_ME_IN_LATER, address:"Silver City, NM" , name:"Silver City" , description:"Check out the history" , image_url:"https://www.rent.com/blog/wp-content/uploads/2024/09/Shutterstock-pc-silci-hero.jpg" , start_time:"2025-06-11 20:00:00" , end_time:"2025-06-12 10:00:00")
Place.create(trip_id: FILL_ME_IN_LATER, address:"Frisco, TX" , name:"Frisco" , description:"Home sweet home" , image_url:"https://www.southernliving.com/thmb/GYMNAAFsYs2yVU92c2prxgdjcDc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/downtown-in-the-fall_roger-robinson_submitted-for-inaugural-2010-cvb-photo-contest-37beaf6e5056a36_37beb255-5056-a36a-07fa8701c5c57a17-1-ecfa390d65b54fb395e4b22dda312022.jpg" , start_time:"2025-06-12 20:00:00" , end_time:"2025-06-12 20:00:00")

# Next Trip for User 2
# Places

##################################################################
# Admin User 3
User.create(name: "admin",
email: "admin@admin.com", password: "password", password_confirmation: "password")

#SUGGESTED TRIPS
# First Trip for User 3 (admin)
Trip.create(user_id: 3,
title: "Tokyo",
image_url: "https://lh5.googleusercontent.com/p/AF1QipPZa5w7mcXMmH5OFbFoXEMPy1UcQN6_ZuxzTrKE=w408-h408-k-no",
)
# Places
Place.create(trip_id: FILL_ME_IN_LATER,
address: "11 Naitomachi, Shinjuku City, Tokyo 160-0014, Japan",
name: "Shinjuku Gyoen National Garden",
description: "This former estate is now a 144-acre park with diverse garden areas, grassy expanses & a greenhouse.",
image_url: "https://lh5.googleusercontent.com/p/AF1QipOsuysK9azBU4Unh6hpWU8jv2EG0zoLYxVftAhx=w408-h272-k-no")
Place.create(trip_id: FILL_ME_IN_LATER,
address: "Kitayama, Fujinomiya, Shizuoka 418-0112, Japan",
name: "Mount Fuji",
description: "Iconic snow-capped peak & volcano, the highest in Japan & the 7th highest island peak on earth.",
image_url: "https://lh5.googleusercontent.com/p/AF1QipN5rgmCJuXbCzEBoQXsv-ozjRZJ5MhpVUtAEnNe=w408-h422-k-no")
Place.create(trip_id: FILL_ME_IN_LATER,
address: "1 Chome-1-2 Oshiage, Sumida City, Tokyo 131-0045, Japan",
name: "Tokyo Skytree",
description: "World's tallest freestanding broadcasting tower with an observation deck boasting 360-degree views.",
image_url: "https://lh5.googleusercontent.com/p/AF1QipPkHrinKramHo5HstdfR12_EqIkcb1eG3D3Fkwe=w408-h544-k-no")

# Next Trip for User 3 (admin)
Trip.create(user_id: 3,
title: "San Francisco, CA",
image_url: "https://lh5.googleusercontent.com/p/AF1QipPl5TJLa32v-TI9R4NTzer2unsKPrMFCwaraX0e=w408-h544-k-no")
# Places
Place.create(trip_id: FILL_ME_IN_LATER,
address: "Golden Gate Brg, San Francisco, CA",
name: "Golden Gate Bridge",
description: "Famed 4,200 ft art deco suspension bridge open to car, bike & foot traffic.",
image_url: "https://lh5.googleusercontent.com/p/AF1QipPNDwezsBE_32Ywqn0WjpRcLNIP0mSS-0evFuUq=w408-h544-k-no")
Place.create(trip_id: FILL_ME_IN_LATER,
address: "505 Beach St, San Francisco, CA 94133",
name: "Fisherman's Wharf",
description: "Bustling waterfront area with seafood restaurants, shopping, an aquarium, sea lions & ferry tours.",
image_url: "https://lh5.googleusercontent.com/p/AF1QipN-cPV9hVelheImXcLJpkTG4pj4aVzyDbkQGryH=w408-h272-k-no")
Place.create(trip_id: FILL_ME_IN_LATER,
address: "1199 9th Ave, San Francisco, CA 94122",
name: "Golden Gate Park",
description: "The city's 1,017-acre oasis draws hikers, bikers, art lovers & music fans, plus gardens & museums.",
image_url: "https://lh3.googleusercontent.com/gps-proxy/ALd4DhEPXBlfMLYxiG6pzOcpqmtgI-HNCh8ghpsJrArjmPVGJiEERuWd_2SZNshePkr6HcYhMfAIugmDZkzJN_-dqus2k_22J21q5Qrp9oYKQtAAcSGALAnAOXiwwy9z5nkRWBJxW75DaKEiZlx16yiIbt6ZDZ1FUTJuTxXEg5VcEmpecyezBS24mRKI=w408-h272-k-no")

# Next Trip for User 3 (admin)
Trip.create(user_id: 3,
title: "Austin, TX",
image_url: "https://lh5.googleusercontent.com/p/AF1QipNZAXlkpYiWdMfQ8mu2hahgjtSi0gH4Q9lMVVi3=w426-h240-k-no")
# Places
Place.create(trip_id: FILL_ME_IN_LATER,
address: "Barton Springs Rd, Austin, TX 78704",
name: "Barton Springs",
description: "Natural springs area & hangout spot, known for swimming, leafy picnic spots & endangered salamander.",
image_url: "https://lh5.googleusercontent.com/p/AF1QipMOEwi_Dun6xWVJ82gxleXFePEb5eHXUhxH7eBI=w408-h306-k-no")
Place.create(trip_id: FILL_ME_IN_LATER,
address: "1100 Congress Ave., Austin, TX 78701",
name: "Texas Capitol",
description: "The 1888 granite & marble structure has a significant rotunda & dome, plus House & Senate chambers.",
image_url: "https://lh5.googleusercontent.com/p/AF1QipPxHztQXGf7oSqeoaRTR6ppaCzeZDOUAFViBZ4d=w426-h240-k-no")
Place.create(trip_id: FILL_ME_IN_LATER,
address: "Fredericksburg, Texas 78624",
name: "Fredericksburg",
description: "Fredericksburg is a city in central Texas, known for its wineries. The city's German heritage is on display at the Pioneer Museum, which features settlers' homesteads and artifacts. In the nearby town square, Marktplatz, the Vereins Kirche is a replica of a 19th-century German church that once stood in the city. The vast National Museum of the Pacific War features WWII exhibits, including a recreated combat zone.",
image_url: "https://familydestinationsguide.com/wp-content/uploads/2021/07/Old-Town-Fredericksburg.jpg")