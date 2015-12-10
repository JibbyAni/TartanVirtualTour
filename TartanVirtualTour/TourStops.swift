//
//  TourStops.swift
//  TartanVirtualTour
//
//  Created by Jibby Ani on 12/6/15.
//  Copyright (c) 2015 Jibby Ani. All rights reserved.
//
//
import Foundation

class TourStops {
    
    var stops: [TourStop]
    
    init() {
        stops = []
        let tourData = [
            ["Warner Hall","Admissions Office", "Home of the office of the President, Dean of Students, and other administrators. Warner Hall is where you will be receiving all your information as a prospective student", "1", 40.4441871, -79.9433951],
            ["Cohon University Center" , "Student Union", "Jared L. Cohon University Center is our student hub. Things to do include: racquetball or working the Cybex circuit, picking up snail mail or getting career advice, visiting the chapel or University Store, lunching in one of many eateries or grabbing a snack from the convenience store, Entropy+.", "2", 40.4433747, -79.9419628],
            ["Gesling" , "Athletics Stadium", "Gesling Stadium is home to our football and track and field teams. The stadium is surrounded by two residence halls, a parking garage, soccer/intramural field and the Cohon University Center (CC).","3", 40.4432481, -79.9402032],
//            
//            ["Margaret Morrison" , "School of Design", "Margaret Morrison Carnegie Hall hosts facilities for the Schools of Architecture and Design and is home to the Robert L. Preger Intelligent Workplace —a living lab that adapts spaces and technologies as needed to improve the quality of life in the workplace. Originally named Margaret Morrison Carnegie College, it opened in 1906 as a vocational school for women.", "4", 40.4420157,-79.9414634],
//                        ["Posner Hall", "Tepper School of Business", "Posner Hall is home to the Tepper School of Business, named for alumnus David A. Tepper. The Tepper School offers undergraduate, graduate, Ph.D. and executive education programs and boasts 10 Nobel laureates among its faculty and alumni ranks.", "5", 40.4413829,-79.9421339],
//
//           ["College of Fine Arts" , "CFA", "College of Fine Arts is an architectural creation of Henry Hornbostel, the college’s first dean, and is home to its five schools: architecture, art, design, drama and music — as well as three unique interdisciplinary programs: the bachelor’s of humanities & arts, science & arts and computer science & arts.", "6", 40.4416360,-79.9429493],
//        
//                    ["Hunt" , "Student Library", "Hunt Library opened in 1961 as the university’s first dedicated library building and was a gift from Roy and Rachel Hunt. It is the largest of five libraries on campus with more than 600,000 volumes. Watch the building’s evening light show that accentuates the aluminum and glass structure or visit the library’s new state-of-the art facility and collaborative studios.", "7", 40.4411297,-79.9437486],
//        
//            ["Baker/Porter" , "Dietrich College of Humanities and Social Sciences", "Baker/Porter Hall are the oldest buildings on campus and connect via a long, sloped hallway. Porter houses programs like civil and environmental engineering, information systems and social and decision sciences. Baker is home to the Dietrich College of Humanities and Social Sciences. On the first floor you’ll find a sculpture of the university’s first president with a nose that’s worn away due to a legend of luck.", "8",40.4416092,-79.9454311],
//        
//            ["Hamerschlag Hall" , "Electrical and Computer Engineering", "Hamerschlag Hall is home to electrical & computer engineering and mechanical engineering labs, and connects to Roberts Engineering Hall, which mostly houses materials engineering. Hamerschlag’s rotunda is probably the most iconic image on campus. This building also boasts a living roof.","9", 40.4423685,-79.9465629],
//        
//            ["Wean Hall" , "Physics, Math, and Materials Science and Engineering Departments", "Although infamous for it aesthetics, Wean hall proves its worth supporting 3 different departments", "10",40.4427237,-79.9457958],
//        
//            ["Doherty Hall" , "Chemistry, Biology, Chemical Engineering, and Biomedical Engineering Departments", "The Doherty Hall East Laboratories green roof and outdoor classroom fit in with the surrounding green space created by the Gates and Hillman centers project. Green Roof Technology helped to design this roof", "11", 40.4425196,-79.9444923],
//        
//            ["Purnell Center of Arts" , "School of Drama", "The Purnell Center for the Arts is home to our drama school, the nation’s oldest degree-granting drama program, and includes state-of-the-art performance and education facilities like the Philip Chosky Theater and the Miller Gallery.", "12", 40.4434504,-79.9435428],
//        
//                    ["Randy Pausch Memorial bridge" , "Penguin Bridge", "The Pausch Bridge connects one of the university’s fine arts buildings, Purnell Center, with the new Gates & Hillman Centers, the home for computer science at Carnegie Mellon. The bridge features more than 7,000 programmable (and environmentally friendly) LED lights.", "13", 40.4432218,-79.9441168],
//             ["Gates-Hillman Center" , "School of Computer Science", "One of the most architechurally saavy buildings on campus, the Gates-Hillman Center houses the School of Computer Science." , "14", 40.4435239,-79.9445352]
    ]
      
              for var i = 0; i < tourData.count; ++i {
                let tstop = tourData[i][0] as! String
                let subt = tourData[i][1] as! String
                let desc = tourData[i][2] as! String
                let lab = tourData[i][3] as! String
                let xcoord = tourData[i][4] as! Double
                let ycoord = tourData[i][5] as! Double
                let ts = TourStop(tstop: tstop, subt: subt, desc: desc, lab: lab, xcoord: xcoord, ycoord: ycoord)
                stops.append(ts)
                
                }
    }
    

}


    
    

    


