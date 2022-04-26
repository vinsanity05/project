//
//  AllBuildings.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 05/02/2022.
//

import SwiftUI
import MapKit

struct AllBuilding: Identifiable {
    let id = UUID() // create unique ID
    let imageName: String // image of the building
    let name: String // name of the building
    let description: String //description of the building
    let url: String // link/ url of the building
    let coordinates: CLLocationCoordinate2D // coordinates of the building
}

// list of all the buildings
struct AllBuildingList {
    
    static let nameofbuildings = [
        
        AllBuilding(imageName: "Student union",
                    name: "Student Union",
                    description: "We’ve invested £10m to create a new energy-efficient building for the Students’ Union at UWE on our Frenchay Campus, designed to improve the experience of our students with enhanced facilities, spaces and easier to access services.",
                    url: "https://www.uwe.ac.uk/life/campus-and-facilities/students-union-building",
                    coordinates: CLLocationCoordinate2D(latitude: 51.500715, longitude: -2.551080)),
        

        AllBuilding(imageName: "Engineering block",
                    name: "Engineering Block",
                    description: "Home to specialist laboratories, workshops and digital engineering facilities, the building has been designed to complement our practice-based curriculum – bringing engineering to life through real world problems. As a student you can expect live industry briefs and the experience to build an enterprising skill set, so you’re set up to graduate with business acumen and technical qualifications.",
                    url:  "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/engineering-facilities",
                    coordinates: CLLocationCoordinate2D(latitude: 51.500188025145754, longitude: -2.550083548949213)),

        AllBuilding(imageName: "Centre of sport",
                    name: "Centre of Sport",
                    description: "This fantastic £5.5 million facility caters for all abilities and competitive natures.  At our Centre of Sport, you’ll find everything from climbing walls to squash courts, football pitches to fitness studios. And whether you are an elite athlete or a total beginner there is something here for you. We know just how important it is to stay fit and healthy. It not only boosts energy levels and focuses the mind but it also helps you to de-stress and feel happier.",
                    url:  "https://www.uwe.ac.uk/life/activities/sport/sports-facilities",
                    coordinates: CLLocationCoordinate2D(latitude: 51.503924, longitude: -2.547503)),

        AllBuilding(imageName: "Exhibition and Conference Centre",
                    name: "ECC Centre",
                    description: "The UWE ECC, launched in December 2009, is quickly building a reputation amongst major local business as the ideal location for a wide range of business events. Now UWE Bristol's Exhibition and Conference Centre (ECC) has been used as a temporary NHS hospital treating COVID-19 patients.",
                    url:  "https://info.uwe.ac.uk/news/uwenews/news.aspx?id=4027",
                    coordinates: CLLocationCoordinate2D(latitude: 51.502839, longitude: -2.552197)),

        AllBuilding(imageName: "Centre of music",
                    name: "Centre of Music",
                    description: "The Centre of Music is a great resource for musicians, music production, beat-making and DJing. You can Play in groups and take music lessons, book rehearsal rooms and practice rooms. Also be part of a community of passionate musicians and meet new collaborators.",
                    url:  "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/audio-and-music-tech-facilities", coordinates: CLLocationCoordinate2D(latitude: 51.497479, longitude:  -2.546967)),

        AllBuilding(imageName: "B block",
                    name: "B block",
                    description: "In this building, there are plenty of students that study and learn here such as Psychology, Sociology courses and used mainly by the Department of Health and Applied Sciences. Also has a study space called the 'Forum' near C block which is a learning zone on Frenchay Campus that is open to all students.",
                    url:  "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/psychology-sociology-and-criminology-facilities",
                    coordinates: CLLocationCoordinate2D(latitude: 51.498788, longitude: -2.548088)),
 
        AllBuilding(imageName: "Q block",
                    name: "Q Block",
                    description: "This building houses the Department of Computer Science and Creative Technology.  This building also has a study space called ‘The Hive’.  Inside, staff and students will be working on exciting new concepts or testing and developing prototypes using the latest technology and simulation equipment.",
                    url:  "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/computer-science-facilities", coordinates: CLLocationCoordinate2D(latitude: 51.501581, longitude: -2.548679)),

        AllBuilding(imageName: "R block",
                    name: "R block",
                    description: "Our award-winning R Block is home to fantastic facilities and inspiring industry-recognised teaching staff. There's all the latest technical equipment, and stunning studio facilities. Here you can make the most of Integrated studios for computer-aided design (CAD). Model-making and drawing resources, Architectural modelling resources and our supportive team will be on-hand to help you make the most of all our industry-standard equipment.",
                    url:  "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/architecture-facilities",
                    coordinates: CLLocationCoordinate2D(latitude: 51.502398, longitude: -2.549000)),
    
        AllBuilding(imageName: "S block",
                    name: "S Block",
                    description: "S Block is the home to our fantastic facilities and resources for learning and teaching High quality teaching rooms. This building is where you can practice in an environment similar to the real schools where you’ll be inspiring young minds.",
                    url:  "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/education-and-teaching-facilities", coordinates: CLLocationCoordinate2D(latitude: 51.49783746792791, longitude: -2.5481770415056797)),
      
        AllBuilding(imageName: "Library",
                    name: "Frenchay Library",
                    description: "This block is the D block area. This block contains the library which hosts a large selection of books as well numerous study spaces such as the quiet study zone and silent study zone.",
                    url:  "https://www.uwe.ac.uk/study/library/our-libraries/frenchay-library",
                    coordinates: CLLocationCoordinate2D(latitude: 51.499955, longitude: -2.548471)),
   
        AllBuilding(imageName: "Wallscourt Park",
                    name: "Wallscourt Park",
                    description: "Wallscourt Park is similar to the student village but in a different location for you to stay in 1st year. It is a great choice if you want to be close to facilities such as the library and Student Union.",
                    url:  "https://www.uwe.ac.uk/life/accommodation/wallscourt-park",
                    coordinates: CLLocationCoordinate2D(latitude: 51.499169, longitude: -2.550888)),
   
        AllBuilding(imageName: "Bristol Robotics Lab",
                    name: "Bristol Robotics Laboratory",
                    description: "Bristol Robotics Laboratory (BRL) is a nationally and internationally recognised as a centre of excellence for advanced robotics research.",
                    url:  "https://www.uwe.ac.uk/life/campus-and-facilities/bristol-robotics-laboratory",
                    coordinates: CLLocationCoordinate2D(latitude: 51.501346, longitude: -2.551715)),
    
        AllBuilding(imageName: "student village",
                    name: "Student Village",
                    description: "This is where nearly 3,000 students live in 1st year.  A great choice if you would like to be close to lecture theatres, the Library, computer rooms, The Students’ Union and Centre for Sport.",
                    url:  "https://www.uwe.ac.uk/life/accommodation/student-village",
                    coordinates: CLLocationCoordinate2D(latitude: 51.503307, longitude: -2.547648)),
   
        AllBuilding(imageName: "Bristol Business School",
                    name: "Business School",
                    description: "The result of a £55 million vision, the Bristol Business School building is the largest on Frenchay Campus.  Through Bristol Business School’s diverse range of practical courses and research, with national and international links, we deliver an educational experience that enables our students to meet their future career ambitions.",
                    url:  "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/business-accounting-marketing-and-economics",
                    coordinates: CLLocationCoordinate2D(latitude: 51.501210, longitude: -2.549965)),
     
        AllBuilding(imageName: "The octagon",
                    name: "The Octagon",
                    description: "The Octagon is a sanctuary space for staff and students where you can relax, read and meet friends. There are rooms available for solo or group prayer, worship, meditation and quiet reflection. There are also a number of books available to enable you to learn and explore your own faith and spirituality, as well as a wellbeing library.",
                    url:  "https://www.uwe.ac.uk/life/campus-and-facilities/social-spaces/the-octagon",
                    coordinates: CLLocationCoordinate2D(latitude: 51.50022987533622, longitude: -2.5488593536942945)),
         
    ]
}

