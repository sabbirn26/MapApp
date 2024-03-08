//
//  LocationsDataService.swift
//  MapTest
//
//  Created by Nick Sarno on 11/26/21.
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
        Location(
            name: "Museum",
            cityName: "Shahbagh",
            coordinates: CLLocationCoordinate2D(latitude: 23.738245791397617, longitude: 90.39467132329207),
            description: "The Bangladesh National Museum (Bengali: বাংলাদেশ জাতীয় জাদুঘর), is the national museum of Bangladesh. The museum is well organized and displays have been housed chronologically in several departments like department of ethnography and decorative art, department of history and classical art, department of natural history, and department of contemporary and world civilization. The museum also has a rich conservation laboratory. Nalini Kanta Bhattasali served as the first curator of the museum during 1914–1947.",
            imageNames: [
                "museum-1",
                "museum-2",
                "museum-3",
            ],
            link: "https://en.wikipedia.org/wiki/Bangladesh_National_Museum"),
        Location(
            name: "Lalbagh Fort",
            cityName: "Lalbagh",
            coordinates: CLLocationCoordinate2D(latitude: 23.722924805680833, longitude: 90.3879838108528),
            description: "Lalbagh Fort (Bengali: লালবাগ কেল্লা) is a fort in the old city of Dhaka, Bangladesh. Its name is derived from its neighborhood Lalbagh, which means Red Garden. The term Lalbagh refers to reddish and pinkish architecture from the Mughal period. The original fort was called Fort Aurangabad. Its construction was started by Prince Muhammad Azam Shah, who was the son of Emperor Aurangzeb and a future Mughal emperor himself. After the prince was recalled by his father, the fort's construction was overseen by Shaista Khan. The death of Shaista Khan's daughter Pari Bibi (Fairy Lady) resulted in a halt to the construction process, apparently due to Shaista Khan's superstition that the fort brought bad omen. Pari Bibi was buried inside the fort.",
            imageNames: [
                "lalbagh-fort-1",
                "lalbagh-fort-2",
                "lalbagh-fort-3",
            ],
            link: "https://en.wikipedia.org/wiki/Lalbagh_Fort"),
        Location(
            name: "Military Museum",
            cityName: "Dhaka",
            coordinates: CLLocationCoordinate2D(latitude: 23.76452006584296, longitude: 90.38548777301149),
            description: "Bangabandhu Military Museum is a military museum of Bangladesh. Administered by the Bangladesh Army, the museum is located right beside the Bangabandhu Sheikh Mujibur Rahman Novo Theatre at Bijoy Sarani of the capital Dhaka. The museum has a collection of Bangladesh's military history, heritage, success stories and various weapons and ammunition.It is now most popular to the young generation and also to the ll ages people.",
            imageNames: [
                "military-m-1",
                "military-m-2",
                "military-m-3",
                "military-m-4",
                "military-m-5"
            ],
            link: "https://en.wikipedia.org/wiki/Bangabandhu_Military_Museum"),
        Location(
            name: "Colosseum",
            cityName: "Rome",
            coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
            description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
            imageNames: [
                "rome-colosseum-1",
                "rome-colosseum-2",
                "rome-colosseum-3",
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum"),
        Location(
            name: "Pantheon",
            cityName: "Rome",
            coordinates: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
            description: "The Pantheon is a former Roman temple and since the year 609 a Catholic church, in Rome, Italy, on the site of an earlier temple commissioned by Marcus Agrippa during the reign of Augustus.",
            imageNames: [
                "rome-pantheon-1",
                "rome-pantheon-2",
                "rome-pantheon-3",
            ],
            link: "https://en.wikipedia.org/wiki/Pantheon,_Rome"),
        Location(
            name: "Trevi Fountain",
            cityName: "Rome",
            coordinates: CLLocationCoordinate2D(latitude: 41.9009, longitude: 12.4833),
            description: "The Trevi Fountain is a fountain in the Trevi district in Rome, Italy, designed by Italian architect Nicola Salvi and completed by Giuseppe Pannini and several others. Standing 26.3 metres high and 49.15 metres wide, it is the largest Baroque fountain in the city and one of the most famous fountains in the world.",
            imageNames: [
                "rome-trevifountain-1",
                "rome-trevifountain-2",
                "rome-trevifountain-3",
            ],
            link: "https://en.wikipedia.org/wiki/Trevi_Fountain"),
        Location(
            name: "Eiffel Tower",
            cityName: "Paris",
            coordinates: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.2945),
            description: "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower. Locally nicknamed 'La dame de fer', it was constructed from 1887 to 1889 as the centerpiece of the 1889 World's Fair and was initially criticized by some of France's leading artists and intellectuals for its design, but it has become a global cultural icon of France and one of the most recognizable structures in the world.",
            imageNames: [
                "paris-eiffeltower-1",
                "paris-eiffeltower-2",
            ],
            link: "https://en.wikipedia.org/wiki/Eiffel_Tower"),
        Location(
            name: "Louvre Museum",
            cityName: "Paris",
            coordinates: CLLocationCoordinate2D(latitude: 48.8606, longitude: 2.3376),
            description: "The Louvre, or the Louvre Museum, is the world's most-visited museum and a historic monument in Paris, France. It is the home of some of the best-known works of art, including the Mona Lisa and the Venus de Milo. A central landmark of the city, it is located on the Right Bank of the Seine in the city's 1st arrondissement.",
            imageNames: [
                "paris-louvre-1",
                "paris-louvre-2",
                "paris-louvre-3",
            ],
            link: "https://en.wikipedia.org/wiki/Louvre"),
    ]
    
}
