//
//  BuildingsDataService.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 02/02/2022.
//

import Foundation
import MapKit

class BuildingsDataService {
    
    // Information about the building from various of UWE websites.
    static let buildings: [Building] = [
        
        Building(name: "Student Union",
                 description: "We’ve invested £10m to create a new energy-efficient building for the Students’ Union at UWE on our Frenchay Campus, designed to improve the experience of our students with enhanced facilities, spaces and easier to access services.",
                 imageNames: ["Student union"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.500715, longitude: -2.551080),
                 link: "https://www.uwe.ac.uk/life/campus-and-facilities/students-union-building"),
        
        Building(name: "Engineering Block",
                 description: "Home to specialist laboratories, workshops and digital engineering facilities, the building has been designed to complement our practice-based curriculum – bringing engineering to life through real world problems. As a student you can expect live industry briefs and the experience to build an enterprising skill set, so you’re set up to graduate with business acumen and technical qualifications.",
                 imageNames: ["Engineering block"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.500188025145754, longitude: -2.550083548949213),
                 link: "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/engineering-facilities"),
        
        Building(name: "Centre of Sport",
                 description: "This fantastic £5.5 million facility caters for all abilities and competitive natures.  At our Centre of Sport, you’ll find everything from climbing walls to squash courts, football pitches to fitness studios. And whether you are an elite athlete or a total beginner there is something here for you. We know just how important it is to stay fit and healthy. It not only boosts energy levels and focuses the mind but it also helps you to de-stress and feel happier.",
                 imageNames: ["Centre of sport"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.503924, longitude: -2.547503),
                 link: "https://www.uwe.ac.uk/life/activities/sport/sports-facilities"),
        
        Building(name: "ECC Centre",
                 description: "The UWE ECC, launched in December 2009, is quickly building a reputation amongst major local business as the ideal location for a wide range of business events. Now UWE Bristol's Exhibition and Conference Centre (ECC) has been used as a temporary NHS hospital treating COVID-19 patients.",
                 imageNames: ["Exhibition and Conference Centre"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.502839, longitude: -2.552197),
                 link: "https://info.uwe.ac.uk/news/uwenews/news.aspx?id=4027"),
        
        Building(name: "Centre of Music",
                 description: "The Centre of Music is a great resource for musicians, music production, beat-making and DJing. You can Play in groups and take music lessons, book rehearsal rooms and practice rooms. Also be part of a community of passionate musicians and meet new collaborators.",
                 imageNames: ["Centre of music", "Centre of music 2"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.497479, longitude:  -2.546967),
                 link: "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/audio-and-music-tech-facilities"),
        
        Building(name: "B Block",
                 description: "In this building, there are plenty of students that study and learn here such as Psychology, Sociology courses and used mainly by the Department of Health and Applied Sciences. Also has a study space called the 'Forum' near C block which is a learning zone on Frenchay Campus that is open to all students.",
                 imageNames: ["B block", "Forum"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.498788, longitude: -2.548088),
                 link: "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/psychology-sociology-and-criminology-facilities"),
        
        Building(name: "Q Block",
                 description: "This building houses the Department of Computer Science and Creative Technology.  This building also has a study space called ‘The Hive’.  Inside, staff and students will be working on exciting new concepts or testing and developing prototypes using the latest technology and simulation equipment.",
                 imageNames: ["Q block", "The Hive"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.501581, longitude: -2.548679),
                 link: "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/computer-science-facilities"),
        
        Building(name: "R Block",
                 description: "Our award-winning R Block is home to fantastic facilities and inspiring industry-recognised teaching staff. There's all the latest technical equipment, and stunning studio facilities. Here you can make the most of Integrated studios for computer-aided design (CAD). Model-making and drawing resources, Architectural modelling resources and our supportive team will be on-hand to help you make the most of all our industry-standard equipment.",
                 imageNames: ["R block"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.502398, longitude: -2.549000),
                 link: "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/architecture-facilities"),
        
        Building(name: "S Block",
                 description: "S Block is the home to our fantastic facilities and resources for learning and teaching High quality teaching rooms. This building is where you can practice in an environment similar to the real schools where you’ll be inspiring young minds.",
                 imageNames: ["S block"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.49783746792791, longitude: -2.5481770415056797),
                 link: "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/education-and-teaching-facilities"),
        
        Building(name: "Frenchay Library",
                 description: "This block is the D block area. This block contains the library which hosts a large selection of books as well numerous study spaces such as the quiet study zone and silent study zone.",
                 imageNames: ["Library"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.499955, longitude: -2.548471),
                 link: "https://www.uwe.ac.uk/study/library/our-libraries/frenchay-library"),
        
        Building(name: "Wallscourt Park",
                 description: "Wallscourt Park is similar to the student village but in a different location for you to stay in 1st year. It is a great choice if you want to be close to facilities such as the library and Student Union.", imageNames: ["Wallscourt Park"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.499169, longitude: -2.550888),
                 link: "https://www.uwe.ac.uk/life/accommodation/wallscourt-park"),
        
        Building(name: "Bristol Robotics Lab",
                 description: "Bristol Robotics Laboratory (BRL) is a nationally and internationally recognised as a centre of excellence for advanced robotics research.",
                 imageNames: ["Bristol Robotics Lab"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.501346, longitude: -2.551715),
                 link: "https://www.uwe.ac.uk/life/campus-and-facilities/bristol-robotics-laboratory"),
        
        Building(name: "Student Village",
                 description: "This is where nearly 3,000 students live in 1st year.  A great choice if you would like to be close to lecture theatres, the Library, computer rooms, The Students’ Union and Centre for Sport.",
                 imageNames: ["student village"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.503307, longitude: -2.547648),
                 link: "https://www.uwe.ac.uk/life/accommodation/student-village"),
        
        Building(name: "Bristol Business School",
                 description: "The result of a £55 million vision, the Bristol Business School building is the largest on Frenchay Campus.  Through Bristol Business School’s diverse range of practical courses and research, with national and international links, we deliver an educational experience that enables our students to meet their future career ambitions.",
                 imageNames: ["Bristol Business School"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.501210, longitude: -2.549965),
                 link: "https://www.uwe.ac.uk/life/campus-and-facilities/course-facilities-by-subject/business-accounting-marketing-and-economics"),
        
        Building(name: "The Octagon",
                 description: "The Octagon is a sanctuary space for staff and students where you can relax, read and meet friends. There are rooms available for solo or group prayer, worship, meditation and quiet reflection. There are also a number of books available to enable you to learn and explore your own faith and spirituality, as well as a wellbeing library.",
                 imageNames: ["The octagon"],
                 coordinates: CLLocationCoordinate2D(latitude: 51.50022987533622, longitude: -2.5488593536942945),
                 link: "https://www.uwe.ac.uk/life/campus-and-facilities/social-spaces/the-octagon")
        
    ]
}
